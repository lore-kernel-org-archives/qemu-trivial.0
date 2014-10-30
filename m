Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjkhw-000381-JN
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 04:03:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xjkhp-0002vr-Ie
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 04:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xjkhk-0003h4-NO
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 04:03:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xjkha-0003cO-5G; Thu, 30 Oct 2014 04:03:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8348946E98;
	Thu, 30 Oct 2014 11:03:24 +0300 (MSK)
Message-ID: <5451F0CC.3030100@msgid.tls.msk.ru>
Date: Thu, 30 Oct 2014 11:03:24 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414579937-1064-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414579937-1064-1-git-send-email-arei.gonglei@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, weidong.huang@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] virtio-9p-proxy: Fix sockfd leak and
 modify the check logic
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Oct 2014 08:03:47 -0000

29.10.2014 13:52, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> If connect() return false, the sockfd will leak,
> meanwhile proxy_init() can't check the return value
> of connect_namedsocket(), maybe cause unpredictable
> results.
> 
> Let's move the sock_id check logic out, which can
> check both if and else statements.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/9pfs/virtio-9p-proxy.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index b57966d..1c3aa5f 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -1112,6 +1112,7 @@ static int connect_namedsocket(const char *path)
>      size = strlen(helper.sun_path) + sizeof(helper.sun_family);
>      if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
>          fprintf(stderr, "socket error\n");
> +        close(sockfd);
>          return -1;
>      }
>  
> @@ -1152,11 +1153,12 @@ static int proxy_init(FsContext *ctx)
>          sock_id = connect_namedsocket(ctx->fs_root);
>      } else {
>          sock_id = atoi(ctx->fs_root);
> -        if (sock_id < 0) {
> -            fprintf(stderr, "socket descriptor not initialized\n");
> -            g_free(proxy);
> -            return -1;
> -        }
> +    }
> +
> +    if (sock_id < 0) {
> +        fprintf(stderr, "socket descriptor not initialized\n");
> +        g_free(proxy);
> +        return -1;
>      }
>      g_free(ctx->fs_root);
>      ctx->fs_root = NULL;


Um. I'm applying 2 patches instead of this one.  First:



virtio-9p-proxy: Fix sockfd leak

If connect() in connect_namedsocket() return false, the sockfd will leak.
Plug it.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index b57966d..e6bbb06 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1112,6 +1112,7 @@ static int connect_namedsocket(const char *path)
     size = strlen(helper.sun_path) + sizeof(helper.sun_family);
     if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
         fprintf(stderr, "socket error\n");
+        close(sockfd);
         return -1;
     }



And second.  Note the slight change in logic and error messages
compared with your version - there's no need to print error
message twice if connect_namedsocket() returned -1 (it already
printed error message).

virtio-9p-proxy: fix error return in proxy_init()

proxy_init() does not check the return value of connect_namedsocket(),
fix this by rearranging code a little bit.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index e6bbb06..2ec211b 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1155,10 +1155,12 @@ static int proxy_init(FsContext *ctx)
         sock_id = atoi(ctx->fs_root);
         if (sock_id < 0) {
             fprintf(stderr, "socket descriptor not initialized\n");
-            g_free(proxy);
-            return -1;
         }
     }
+    if (sock_id < 0) {
+        g_free(proxy);
+        return -1;
+    }
     g_free(ctx->fs_root);
     ctx->fs_root = NULL;


And I'll immediately send another followup patch to improve
error messages in connect_namedsocket(), -- these are awful.

/mjt


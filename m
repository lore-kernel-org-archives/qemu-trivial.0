Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXPvh-000700-1q
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 03:59:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXPvc-0006uM-B4
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXPvT-0004IQ-4a
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:59:12 -0400
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:41673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YXPvS-0004Hl-H1
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:59:03 -0400
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Mon, 16 Mar 2015 13:28:58 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp05.in.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Mar 2015 13:28:55 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 1F21A125804B;
	Mon, 16 Mar 2015 13:30:24 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2G7wqUd31653960; Mon, 16 Mar 2015 13:28:53 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2G7wqOP011726; Mon, 16 Mar 2015 13:28:52 +0530
Received: from skywalker.linux.vnet.ibm.com (skywalker.in.ibm.com
	[9.124.35.26])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2G7wqK3011711
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 16 Mar 2015 13:28:52 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
In-Reply-To: <1426244956-5316-1-git-send-email-zhaoshenglong@huawei.com>
References: <1426244956-5316-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Mon, 16 Mar 2015 13:28:51 +0530
Message-ID: <87egopmkzo.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031607-0017-0000-0000-0000041EA9E8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.5
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-proxy: Fix possible
	overflow
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
X-List-Received-Date: Mon, 16 Mar 2015 07:59:15 -0000

Shannon Zhao <zhaoshenglong@huawei.com> writes:

> It's detected by coverity. As max of sockaddr_un.sun_path is
> sizeof(helper.sun_path), should check the length of source
> and use strncpy instead of strcpy.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/9pfs/virtio-9p-proxy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index 59c7445..fb1ab7b 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -1102,12 +1102,13 @@ static int connect_namedsocket(const char *path)
>      int sockfd, size;
>      struct sockaddr_un helper;
>  
> +    g_assert(strlen(path) < sizeof(helper.sun_path));

Since we are doing this from within Qemu, I did the below and folded
that into other sockadd_un.sun_path size checking patch.

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 6bb191ee6ab8..71b6198bbd22 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1100,6 +1100,10 @@ static int connect_namedsocket(const char *path)
     int sockfd, size;
     struct sockaddr_un helper;
 
+    if (strlen(path) >= sizeof(helper.sun_path)) {
+        fprintf(stderr, "Socket name too large\n");
+        return -1;
+    }
     sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (sockfd < 0) {
         fprintf(stderr, "failed to create socket: %s\n", strerror(errno));


Let me know if that is ok for you.
         
>      sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
>      if (sockfd < 0) {
>          fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
>          return -1;
>      }
> -    strcpy(helper.sun_path, path);
> +    strncpy(helper.sun_path, path, sizeof(helper.sun_path));
>      helper.sun_family = AF_UNIX;
>      size = strlen(helper.sun_path) + sizeof(helper.sun_family);
>      if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
> -- 
> 1.8.3.1



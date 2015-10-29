Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhp4-0002AD-HU
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:40:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhp1-00027q-Go
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhp0-0004nO-E4
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:40:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zrhou-0004ml-9j; Thu, 29 Oct 2015 03:40:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A329F42107;
	Thu, 29 Oct 2015 10:40:23 +0300 (MSK)
Message-ID: <5631CD67.9000109@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:40:23 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1442227210-24604-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1442227210-24604-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: multipart/mixed; boundary="------------060202050200030608010408"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] piix: fix resource leak reported by
	Coverity
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
X-List-Received-Date: Thu, 29 Oct 2015 07:40:33 -0000

This is a multi-part message in MIME format.
--------------060202050200030608010408
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

14.09.2015 13:40, zhanghailiang wrote:
> config_fd should be closed before return, or there will
> be a resource leak error.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/pci-host/piix.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 1fb71c8..7b2fbf9 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -764,6 +764,7 @@ static int host_pci_config_read(int pos, int len, uint32_t val)
>      /* Access real host bridge. */
>      int rc = snprintf(path, size, "/sys/bus/pci/devices/%04x:%02x:%02x.%d/%s",
>                        0, 0, 0, 0, "config");
> +    int ret = 0;
>  
>      if (rc >= size || rc < 0) {
>          return -ENODEV;
> @@ -775,16 +776,18 @@ static int host_pci_config_read(int pos, int len, uint32_t val)
>      }
>  
>      if (lseek(config_fd, pos, SEEK_SET) != pos) {
> -        return -errno;
> +        ret = -errno;
> +        goto out;
>      }
>      do {
>          rc = read(config_fd, (uint8_t *)&val, len);
>      } while (rc < 0 && (errno == EINTR || errno == EAGAIN));
>      if (rc != len) {
> -        return -errno;
> +        ret = -errno;
>      }
> -
> -    return 0;
> +out:
> +    close(config_fd);
> +    return ret;
>  }
>  
>  static int igd_pt_i440fx_initfn(struct PCIDevice *pci_dev)

How about the attached (untested)?

Thanks,

/mjt


--------------060202050200030608010408
Content-Type: text/x-patch;
 name="piix-fix-resource-leak.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="piix-fix-resource-leak.diff"

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 7b2fbf9..42f847d 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -764,7 +764,6 @@ static int host_pci_config_read(int pos, int len, uint32_t val)
     /* Access real host bridge. */
     int rc = snprintf(path, size, "/sys/bus/pci/devices/%04x:%02x:%02x.%d/%s",
                       0, 0, 0, 0, "config");
-    int ret = 0;
 
     if (rc >= size || rc < 0) {
         return -ENODEV;
@@ -774,20 +773,15 @@ static int host_pci_config_read(int pos, int len, uint32_t val)
     if (config_fd < 0) {
         return -ENODEV;
     }
-
-    if (lseek(config_fd, pos, SEEK_SET) != pos) {
-        ret = -errno;
-        goto out;
-    }
     do {
-        rc = read(config_fd, (uint8_t *)&val, len);
+        rc = pread(config_fd, (uint8_t *)&val, len, pos);
     } while (rc < 0 && (errno == EINTR || errno == EAGAIN));
+    close(config_fd);
     if (rc != len) {
-        ret = -errno;
+        return -errno;
     }
-out:
-    close(config_fd);
-    return ret;
+
+    return 0;
 }
 
 static int igd_pt_i440fx_initfn(struct PCIDevice *pci_dev)

--------------060202050200030608010408--


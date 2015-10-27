Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zr0VW-000101-6p
	for mharc-qemu-trivial@gnu.org; Tue, 27 Oct 2015 05:25:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=735afa564=roger.pau@citrix.com>)
	id 1Zr0VT-0000v1-4l
	for qemu-trivial@nongnu.org; Tue, 27 Oct 2015 05:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=735afa564=roger.pau@citrix.com>)
	id 1Zr0VP-0005BG-0i
	for qemu-trivial@nongnu.org; Tue, 27 Oct 2015 05:25:27 -0400
Received: from smtp.citrix.com ([66.165.176.89]:30622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=735afa564=roger.pau@citrix.com>)
	id 1Zr0VO-0005BB-S6; Tue, 27 Oct 2015 05:25:22 -0400
X-IronPort-AV: E=Sophos;i="5.20,204,1444694400"; d="scan'208";a="308423360"
To: Ed Maste <emaste@freebsd.org>, <qemu-devel@nongnu.org>
References: <1445611173-57034-1-git-send-email-emaste@freebsd.org>
	<1445615635-90549-1-git-send-email-emaste@freebsd.org>
From: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <562F42FA.5040805@citrix.com>
Date: Tue, 27 Oct 2015 10:25:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445615635-90549-1-git-send-email-emaste@freebsd.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-DLP: MIA1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, Stefan
	Hajnoczi <stefanha@redhat.com>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tap-bsd: use user-specified
 tap device if it already exists
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
X-List-Received-Date: Tue, 27 Oct 2015 09:25:28 -0000

Ccing the maintainers.

El 23/10/15 a les 17.53, Ed Maste ha escrit:
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
> As an aside this was reviewed on FreeBSD's Phabricator here:
> https://reviews.freebsd.org/D3969
> 
> Resend with Signed-off-by.
> 
>  net/tap-bsd.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 7028d9b..0103a97 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -109,8 +109,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>  
>  #define PATH_NET_TAP "/dev/tap"
>  
> -int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
> -             int vnet_hdr_required, int mq_required, Error **errp)
> +static int tap_open_clone(char *ifname, int ifname_size, Error **errp)
>  {
>      int fd, s, ret;
>      struct ifreq ifr;
> @@ -126,7 +125,8 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>      ret = ioctl(fd, TAPGIFNAME, (void *)&ifr);
>      if (ret < 0) {
>          error_setg_errno(errp, errno, "could not get tap interface name");
> -        goto error;
> +        close(fd);
> +        return -1;
>      }
>  
>      if (ifname[0] != '\0') {
> @@ -135,19 +135,47 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>          if (s < 0) {
>              error_setg_errno(errp, errno,
>                               "could not open socket to set interface name");
> -            goto error;
> +            close(fd);
> +            return -1;
>          }
>          ifr.ifr_data = ifname;
>          ret = ioctl(s, SIOCSIFNAME, (void *)&ifr);
>          close(s);
>          if (ret < 0) {
>              error_setg(errp, "could not set tap interface name");
> -            goto error;
> +            close(fd);
> +            return -1;
>          }
>      } else {
>          pstrcpy(ifname, ifname_size, ifr.ifr_name);
>      }
>  
> +    return fd;
> +}
> +
> +int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
> +             int vnet_hdr_required, int mq_required, Error **errp)
> +{
> +    int fd = -1;
> +
> +    /* If the specified tap device already exists just use it. */
> +    if (ifname[0] != '\0') {
> +        char dname[100];
> +        snprintf(dname, sizeof dname, "/dev/%s", ifname);
> +        TFR(fd = open(dname, O_RDWR));
> +        if (fd < 0 && errno != ENOENT) {
> +            error_setg_errno(errp, errno, "could not open %s", dname);
> +            return -1;
> +        }
> +    }
> +
> +    if (fd < 0) {
> +        /* Tap device not specified or does not exist. */
> +        if ((fd = tap_open_clone(ifname, ifname_size, errp)) < 0) {
> +            return -1;
> +        }
> +    }
> +
>      if (*vnet_hdr) {
>          /* BSD doesn't have IFF_VNET_HDR */
>          *vnet_hdr = 0;
> 



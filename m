Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIya8-0008HG-1v
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2016 08:01:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aIya2-00089v-9U
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 08:01:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aIyZx-0002eF-Hm
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 08:01:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aIyZf-0002OH-AF; Tue, 12 Jan 2016 08:01:23 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id D7EC5C0A8058;
	Tue, 12 Jan 2016 13:01:22 +0000 (UTC)
Received: from redhat.com (vpn1-7-155.ams2.redhat.com [10.36.7.155])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0CD1Jxl028442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 12 Jan 2016 08:01:21 -0500
Date: Tue, 12 Jan 2016 13:01:19 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Wolfgang Bumiller <w.bumiller@proxmox.com>
Message-ID: <20160112130119.GK17626@redhat.com>
References: <1452603159-19782-1-git-send-email-w.bumiller@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1452603159-19782-1-git-send-email-w.bumiller@proxmox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: clear vs->tlscreds
	after unparenting it
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 13:01:51 -0000

On Tue, Jan 12, 2016 at 01:52:39PM +0100, Wolfgang Bumiller wrote:
> This pointer should be cleared in vnc_display_close()
> otherwise a use-after-free can happen when when using the
> old style 'x509' and 'tls' options rather than a persistent
> tls-creds -object, by issuing monitor commands to change
> the vnc server like so:
> 
> Start with: -vnc unix:test.socket,x509,tls
> Then use the following monitor command:
>   change vnc unix:test.socket
> 
> After this the pointer is still set but invalid and a crash
> can be triggered for instance by issuing the same command a
> second time which will try to object_unparent() the same
> pointer again.
> ---
>  ui/vnc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 09756cd..35843b5 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3134,6 +3134,7 @@ static void vnc_display_close(VncDisplay *vs)
>      vs->subauth = VNC_AUTH_INVALID;
>      if (vs->tlscreds) {
>          object_unparent(OBJECT(vs->tlscreds));
> +        vs->tlscreds = NULL;
>      }
>      g_free(vs->tlsaclname);
>      vs->tlsaclname = NULL;

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|


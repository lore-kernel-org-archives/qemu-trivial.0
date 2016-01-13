Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJIp1-0003Uc-VX
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 05:38:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aJIoz-0003Qw-Tf
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 05:38:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aJIoy-0001b6-Vj
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 05:38:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aJIou-0001a5-6d; Wed, 13 Jan 2016 05:38:28 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id CA054445A2;
	Wed, 13 Jan 2016 10:38:27 +0000 (UTC)
Received: from redhat.com (vpn1-7-49.ams2.redhat.com [10.36.7.49])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DAcORQ004647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 13 Jan 2016 05:38:26 -0500
Date: Wed, 13 Jan 2016 10:38:24 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Wolfgang Bumiller <w.bumiller@proxmox.com>
Message-ID: <20160113103824.GE26697@redhat.com>
References: <1452681360-29239-1-git-send-email-w.bumiller@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1452681360-29239-1-git-send-email-w.bumiller@proxmox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: fix tls-creds error
	message
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
X-List-Received-Date: Wed, 13 Jan 2016 10:38:35 -0000

On Wed, Jan 13, 2016 at 11:36:00AM +0100, Wolfgang Bumiller wrote:
> The parameter is called 'tls-creds', 'credid' is just the
> variable name in the code.
> 
> Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
> ---
>  ui/vnc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrange <berrange@redhat.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|


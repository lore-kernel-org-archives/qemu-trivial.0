Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d81vR-0005Bl-3y
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 05:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d81vO-0005AB-Hz
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 05:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d81vN-0000O6-R1
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 05:59:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1d81vJ-0000F5-6q; Tue, 09 May 2017 05:59:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C46F9C059724;
	Tue,  9 May 2017 09:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C46F9C059724
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C46F9C059724
Received: from [10.36.116.34] (ovpn-116-34.ams2.redhat.com [10.36.116.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFFA978352;
	Tue,  9 May 2017 09:59:14 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1494322876-28843-1-git-send-email-armbru@redhat.com>
	<1494322876-28843-3-git-send-email-armbru@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2bd72e78-d968-5b29-6a25-c8e5cf1288aa@redhat.com>
Date: Tue, 9 May 2017 11:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494322876-28843-3-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 09 May 2017 09:59:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2]
 docs/qdev-device-use.txt: update section Default Devices
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 09:59:23 -0000

On 09.05.2017 11:41, Markus Armbruster wrote:
> Resynchronize the table of default device suppressions with vl.c's
> default_list[].
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/qdev-device-use.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
> index caf779b..f9f9eaa 100644
> --- a/docs/qdev-device-use.txt
> +++ b/docs/qdev-device-use.txt
> @@ -401,12 +401,13 @@ type.
>  some DEVNAMEs:
>  
>      default device      suppressing DEVNAMEs
> -    CD-ROM              ide-cd, ide-drive, scsi-cd
> -    isa-fdc's driveA    isa-fdc
> +    CD-ROM              ide-cd, ide-drive, ide-hd, scsi-cd, scsi-hd
> +    isa-fdc's driveA    floppy, isa-fdc
>      parallel            isa-parallel
>      serial              isa-serial
> -    VGA                 VGA, cirrus-vga, vmware-svga
> -    virtioconsole       virtio-serial-pci, virtio-serial-s390, virtio-serial

virtio-serial-s390 has been removed by commit 7b3fdbd9a8267, so that
should be OK.

> +    VGA                 VGA, cirrus-vga, isa-vga, isa-cirrus-vga,
> +                        vmware-svga, qxl-vga, virtio-vga
> +    virtioconsole       virtio-serial-pci, virtio-serial
>  
>  The default NIC is connected to a default part created along with it.
>  It is *not* suppressed by configuring a NIC with -device (you may call

Reviewed-by: Thomas Huth <thuth@redhat.com>



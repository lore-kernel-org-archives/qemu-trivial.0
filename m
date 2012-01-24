Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpglM-0005UC-Gx
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 08:50:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RpglD-000586-0B
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 08:50:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Rpgl3-00089S-2q
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 08:50:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:19475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Rpgkr-00087q-WF; Tue, 24 Jan 2012 08:49:46 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0ODnfUs011295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 24 Jan 2012 08:49:41 -0500
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0ODncs1015272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2012 08:49:39 -0500
Message-ID: <4F1EB7BF.8070104@redhat.com>
Date: Tue, 24 Jan 2012 14:53:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Thomas Higdon <thigdon@akamai.com>
References: <20120123171525.GM32632@akamai.com>
In-Reply-To: <20120123171525.GM32632@akamai.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [PATCH] scsi: restrict buffer length to
 req->cmd.xfer for responses to INQUIRY commands.
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
X-List-Received-Date: Tue, 24 Jan 2012 13:50:15 -0000

Am 23.01.2012 18:15, schrieb Thomas Higdon:
> This prevents the emulated SCSI device from trying to DMA more bytes to the
> initiator than are expected. Without this, the SCRIPTS code in the emulated LSI
> device eventually raises a DMA interrupt for a data overrun when an INQUIRY
> command whose buflen exceeds req->cmd.xfer is processed. It's the
> responsibility of the client to provide a request buffer and allocation
> length that are large enough for the result of the command.
> 
> I'm no expert on SCSI (or qemu), but this appears to be more correct behavior
> than before, and makes my SCSI INQUIRY commands more successful.
> 
> Before patch:
> 
> # echo setverbose 2 > /proc/scsi/sym53c8xx/0
> # sginfo -s -TT /dev/sda
>   cdb:     12 00 00 00 24 00
>   inquiry response:
>      00 00 05 02 1f 00 00 12 51 45 4d 55 20 20 20 20
>      51 45 4d 55 20 48 41 52 44 44 49 53 4b 20 20 20
>      31 2e 30 2e
>   cdb:     12 01 00 00 04 00
> [  237.014083] sd 0:0:0:0: extraneous data discarded.
> [  237.014437] sd 0:0:0:0: COMMAND FAILED (87 0 1).
> do_scsi_io: opcode=0x12: Host_status=0x07 [DID_ERROR]
> No serial number (error doing INQUIRY, supported VPDs)
> 
> After:
> 
> # echo setverbose 2 > /proc/scsi/sym53c8xx/0
> # sginfo -s -TT /dev/sda
>   cdb:     12 00 00 00 24 00
>   inquiry response:
>      00 00 05 02 1f 00 00 12 51 45 4d 55 20 20 20 20
>      51 45 4d 55 20 48 41 52 44 44 49 53 4b 20 20 20
>      31 2e 30 2e
>   cdb:     12 01 00 00 04 00
>   cdb:     12 01 80 00 04 00
>   cdb:     12 01 80 00 06 00
>   inquiry (evpd page (0x80) response:
>     00 80 00 02 32 37
> Serial Number '27'
> 
> Command line:
> /usr/bin/qemu-system-x86_64 -S -M pc -enable-kvm -m 1024 -smp 1,sockets=1,cores=1,threads=1 -nodefconfig -nodefaults -chardev socket,id=charmonitor,path=/var/lib/libvirt/qemu/monitor,server,nowait -mon chardev=charmonitor,id=monitor,mode=readline -rtc base=utc -boot d -device lsi,id=scsi0,bus=pci.0,addr=0x5 -drive file=disk.0,if=none,id=drive-scsi0-0-0,format=qcow2 -device scsi-disk,bus=scsi0.0,scsi-id=0,drive=drive-scsi0-0-0,id=scsi0-0-0,serial=27 -drive file=disk.2,if=none,media=cdrom,id=drive-ide0-0-0,readonly=on,format=raw -device ide-drive,bus=ide.0,unit=0,drive=drive-ide0-0-0,id=ide0-0-0  -usb -vnc 0.0.0.0:80 -vga cirrus
> 
> Signed-off-by: Thomas Higdon <thigdon@akamai.com>
> ---
>  hw/scsi-disk.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
> index 5d8bf53..71fe2a3 100644
> --- a/hw/scsi-disk.c
> +++ b/hw/scsi-disk.c
> @@ -477,6 +477,9 @@ static int scsi_disk_emulate_inquiry(SCSIRequest *req, uint8_t *outbuf)
>                   "buffer size %zd\n", page_code, req->cmd.xfer);
>              return -1;
>          }
> +        if (buflen > req->cmd.xfer) {
> +            buflen = req->cmd.xfer;
> +        }
>          /* done with EVPD */
>          return buflen;
>      }

I wonder if it would make sense to make this check in a more central
place like scsi_send_command(). This way we would avoid similar bugs in
other commands.

Kevin


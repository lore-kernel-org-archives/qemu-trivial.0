Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqiz2-0007sm-Kv
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 05:24:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rqiyw-0007VM-NN
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 05:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rqiyv-0005Ut-JY
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 05:24:34 -0500
Received: from cantor2.suse.de ([195.135.220.15]:51942 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Rqiym-0005U1-DF; Fri, 27 Jan 2012 05:24:24 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B065B8891E;
	Fri, 27 Jan 2012 11:24:23 +0100 (CET)
Message-ID: <4F227AD6.5020408@suse.de>
Date: Fri, 27 Jan 2012 11:22:14 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <4F1DA82F.4090808@siemens.com>
In-Reply-To: <4F1DA82F.4090808@siemens.com>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] optionroms: Silence
	intermediate file removal
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
X-List-Received-Date: Fri, 27 Jan 2012 10:24:38 -0000

Am 23.01.2012 19:34, schrieb Jan Kiszka:
> The build process of optionroms spits out an "rm ..." line. Moreover, i=
t
> removes all .o files that can be handy for debugging purposes.
>=20
> Disable automatic intermediate removal and only clean up the unneeded
> and large .img and .raw files.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  pc-bios/optionrom/Makefile |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 51da288..3edde85 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -16,14 +16,16 @@ QEMU_CFLAGS =3D $(CFLAGS)
> =20
>  build-all: multiboot.bin linuxboot.bin
> =20
> +.SECONDARY:
> +
>  %.img: %.o
>  	$(call quiet-command,$(LD) -Ttext 0 -e _start -s -o $@ $<,"  Building=
 $(TARGET_DIR)$@")
> =20
>  %.raw: %.img
> -	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"  Building =
$(TARGET_DIR)$@")
> +	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@; rm -f $<," =
 Building $(TARGET_DIR)$@")
> =20
>  %.bin: %.raw
> -	$(call quiet-command,$(SHELL) $(SRC_PATH)/scripts/signrom.sh $< $@," =
 Signing $(TARGET_DIR)$@")
> +	$(call quiet-command,$(SHELL) $(SRC_PATH)/scripts/signrom.sh $< $@; r=
m -f $<,"  Signing $(TARGET_DIR)$@")
> =20
>  clean:
>  	rm -f *.o *.d *.raw *.img *.bin *~

It's possible that objcopy or a shell script fails. In that case,
&& rm -f $<
or a second output-suppressed Makefile line might be a better than
; rm -f $<

Stefan's comment on .SECONDARY seconded. :)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXiGA-0001Yc-VM
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 18:47:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cheffner@tacnetsol.com>) id 1RXiG8-0001YD-Ns
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:47:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cheffner@tacnetsol.com>) id 1RXiG7-0007HW-GF
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:47:44 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:58417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cheffner@tacnetsol.com>) id 1RXiG7-0007HN-9z
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:47:43 -0500
Received: by dadn15 with SMTP id n15so6543131dad.4
	for <qemu-trivial@nongnu.org>; Mon, 05 Dec 2011 15:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tacnetsol.com; s=tns;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KwNzPqjzCWRaSOXjQAY4JuqUGYwL1XgShVafpBFTGhk=;
	b=arpeVEXDhr4IJX0kKILu1jVj57/hZ6Vfvn+bGP7oqXZGL3Nm9NUE0Sc4rXHwjqevQN
	Rv3P6vLGdaMtVHCjFle7SrgEW6crsPZz8yIFEKLdMm4CDWVkaflsqYahVplsTSItiDmF
	uNakJbdxyOWe4S3+RZeVN1Ct/FEZcRgdAyxdo=
MIME-Version: 1.0
Received: by 10.68.13.101 with SMTP id g5mr27864840pbc.10.1323128861806; Mon,
	05 Dec 2011 15:47:41 -0800 (PST)
Received: by 10.142.202.16 with HTTP; Mon, 5 Dec 2011 15:47:41 -0800 (PST)
In-Reply-To: <EE7FAED6-555F-4A0C-9131-15353A5650C6@tacnetsol.com>
References: <EE7FAED6-555F-4A0C-9131-15353A5650C6@tacnetsol.com>
Date: Mon, 5 Dec 2011 18:47:41 -0500
Message-ID: <CACfWBL1iP0ysszeZsiiqSZnYxqpcvLszTw_ZGGy4769+T7DQ3A@mail.gmail.com>
From: Craig Heffner <cheffner@tacnetsol.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=bcaec520ea27cccf7704b360f174
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.45
Cc: riku.voipio@iki.fi
Subject: Re: [Qemu-trivial] User mode support for Linux ELF files with no
	section headers
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
X-List-Received-Date: Mon, 05 Dec 2011 23:47:45 -0000

--bcaec520ea27cccf7704b360f174
Content-Type: text/plain; charset=ISO-8859-1

CC'd Linux user maintainer.

On Mon, Dec 5, 2011 at 2:14 PM, Craig <cheffner@tacnetsol.com> wrote:

> In user mode Linux, Qemu currently refuses to load ELF files that do not
> contain section headers (ehdr->e_shentsize == 0). Since section headers are
> not required in order to load an ELF file, simply removing the e_shentsize
> check in elf_check_ehdr() allows ELF binaries with no section headers to be
> run properly in user mode:
>
> Signed-off-by: Craig Heffner <cheffner@tacnetsol.com>
> --- qemu/linux-user/elfload.c   2011-12-02 15:16:07.637541215 -0500
> +++ qemu-patched/linux-user/elfload.c   2011-12-02 15:27:24.061522798 -0500
> @@ -1068,7 +1068,6 @@ static bool elf_check_ehdr(struct elfhdr
>     return (elf_check_arch(ehdr->e_machine)
>             && ehdr->e_ehsize == sizeof(struct elfhdr)
>             && ehdr->e_phentsize == sizeof(struct elf_phdr)
> -            && ehdr->e_shentsize == sizeof(struct elf_shdr)
>             && (ehdr->e_type == ET_EXEC || ehdr->e_type == ET_DYN));
>  }
>
>

--bcaec520ea27cccf7704b360f174
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

CC&#39;d Linux user maintainer.<br><br><div class=3D"gmail_quote">On Mon, D=
ec 5, 2011 at 2:14 PM, Craig <span dir=3D"ltr">&lt;<a href=3D"mailto:cheffn=
er@tacnetsol.com">cheffner@tacnetsol.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex;">
In user mode Linux, Qemu currently refuses to load ELF files that do not co=
ntain section headers (ehdr-&gt;e_shentsize =3D=3D 0). Since section header=
s are not required in order to load an ELF file, simply removing the e_shen=
tsize check in elf_check_ehdr() allows ELF binaries with no section headers=
 to be run properly in user mode:<br>

<br>
Signed-off-by: Craig Heffner &lt;<a href=3D"mailto:cheffner@tacnetsol.com">=
cheffner@tacnetsol.com</a>&gt;<br>
--- qemu/linux-user/elfload.c =A0 2011-12-02 15:16:07.637541215 -0500<br>
+++ qemu-patched/linux-user/elfload.c =A0 2011-12-02 15:27:24.061522798 -05=
00<br>
@@ -1068,7 +1068,6 @@ static bool elf_check_ehdr(struct elfhdr<br>
 =A0 =A0 return (elf_check_arch(ehdr-&gt;e_machine)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 &amp;&amp; ehdr-&gt;e_ehsize =3D=3D sizeof(struct =
elfhdr)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 &amp;&amp; ehdr-&gt;e_phentsize =3D=3D sizeof(stru=
ct elf_phdr)<br>
- =A0 =A0 =A0 =A0 =A0 =A0&amp;&amp; ehdr-&gt;e_shentsize =3D=3D sizeof(stru=
ct elf_shdr)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 &amp;&amp; (ehdr-&gt;e_type =3D=3D ET_EXEC || ehdr=
-&gt;e_type =3D=3D ET_DYN));<br>
=A0}<br>
<br>
</blockquote></div><br>

--bcaec520ea27cccf7704b360f174--


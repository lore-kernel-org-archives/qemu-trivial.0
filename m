Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVdvM-0003OG-HR
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 10:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVdvK-0003Nv-2g
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:54:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVdvI-0002rL-Ma
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:54:14 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVdvI-0002qp-Fl
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:54:12 -0500
Received: by mail-oi1-x242.google.com with SMTP id e9so8995895oif.8
 for <qemu-trivial@nongnu.org>; Fri, 15 Nov 2019 07:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=atw3TSAHp5sUoKm0tYtA5WsNLZwGQVqLvIdj5jlFEYk=;
 b=jTb8JCIYaZs7aQAvIfx4dzpQ+X6QxjZ77tfuEfFmcF8Hf8c+KJuPNRaaZMQo4LdmEM
 yvFZaPz3aYITwJCxfKsxRCM3CNEbZwDZNh2KLT+H2FekLi1eM8jf4GqCSsY18F1MYuBs
 fJI+INjrWDNFL9djS5GZRlkgaNifsAWY0g6wkWx1VOkheLggBZbk51Q+kynKoVjHrvgj
 ZdRo2S6cD3PczFyI+CMfy3wZ5fG0bj85YqzoUXDbFs3x+M0cbt4RVjp3H13DaDjbkvtn
 +mDIYoHhFP3AXBeAngc+6jMQEcFEF7LSp98kajtQSt5lyuRpWW7hvrc/ngivixU2GbCD
 k5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=atw3TSAHp5sUoKm0tYtA5WsNLZwGQVqLvIdj5jlFEYk=;
 b=I3neC5SWUVlyn9Sm70VhksE+G/oHdku4jt9qINKYdvmi++nLGYyNZUpr2loUPrslc9
 s8uMv0p4bvse/iw9F+p8gNlqEFiIDyQKzewCqWE0SUyTAHUTICUmGyKxaSldeb6fio5O
 ZHKj6Po/oj4QG5TxxqG6PUhF48ZHKzU6H1HuC3x87pZgFcXPDtOzPXWd6nyPwYe3T4DM
 ir3Txl9xN33BltiKXxUyh6MQODq29f7WUV+HYc+qKJPvrFdtu/w9MR8cIr4Fobcshzbk
 SIztNWhWYh8dQu5OmLt0QLpJY+UTEK7uKQG8Edw1giJmnejA89gUHhwzglYWq6Ufs7Oc
 rsNw==
X-Gm-Message-State: APjAAAXbeve0x2AbijACIzm7hCZlaJ7Lk2mHKoVzP263wc9esEdii60R
 i13UqBhvt05UIC/VfeYSDw9IA7qfPz5O1DyEqyo7Kg==
X-Google-Smtp-Source: APXvYqy9sGkiqFEAlUg2s1s7+P7FjHnRIjCOjyaFptEsoI+8205oUfEtc6F+AoL8/blJ27oQ+YtoEz41TMtEewuNXlY=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr8092284oig.48.1573833251458; 
 Fri, 15 Nov 2019 07:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20191115145049.26868-1-thuth@redhat.com>
In-Reply-To: <20191115145049.26868-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2019 15:54:00 +0000
Message-ID: <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2019 15:54:15 -0000

On Fri, 15 Nov 2019 at 15:10, Thomas Huth <thuth@redhat.com> wrote:
>
> When CONFIG_IDE_ISA is disabled, compilation currently fails:
>
>  hw/i386/pc_piix.c: In function =E2=80=98pc_init1=E2=80=99:
>  hw/i386/pc_piix.c:81:9: error: unused variable =E2=80=98i=E2=80=99 [-Wer=
ror=3Dunused-variable]
>
> Move the variable declaration to the right code block to avoid
> this problem.
>
> Fixes: 4501d317b50e ("hw/i386/pc: Extract pc_i8259_create()")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/i386/pc_piix.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 2aefa3b8df..d187db761c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
>      X86MachineState *x86ms =3D X86_MACHINE(machine);
>      MemoryRegion *system_memory =3D get_system_memory();
>      MemoryRegion *system_io =3D get_system_io();
> -    int i;
>      PCIBus *pci_bus;
>      ISABus *isa_bus;
>      PCII440FXState *i440fx_state;
> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
>      }
>  #ifdef CONFIG_IDE_ISA
>  else {
> -        for(i =3D 0; i < MAX_IDE_BUS; i++) {
> +        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>              ISADevice *dev;
>              char busname[] =3D "ide.0";
>              dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i],

Don't put variable declarations inside 'for' statements,
please. They should go at the start of a {} block.

thanks
-- PMM


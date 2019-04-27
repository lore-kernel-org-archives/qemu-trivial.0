Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hKQKo-0001P5-Hq
	for mharc-qemu-trivial@gnu.org; Sat, 27 Apr 2019 12:37:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQKk-00017k-0N
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 12:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQCi-0002Un-8j
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 12:29:34 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQCg-0002DN-Fw; Sat, 27 Apr 2019 12:29:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id f7so401194wrs.2;
	Sat, 27 Apr 2019 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cM53TFy+cLxuAVp+u99gBNQH0UQPiHbTPlBKpdnp7e8=;
	b=fzYMbmKjZa8mj9y7ezoteOVuh8SiF2cXtkvEtoccGxHAtWOBpIoPWccHqXIkZ4m/hX
	+XWhw9WeAR+YW52m60qHR9JKLIieOvhRhvs+XhZQH48ZZ7LEsTBD4R0m2+ThT6SIdeHM
	o7Mnl+gsQ7EvoKiFYL2rSYWVCmld7GW7b7nVJRMs+rp9CTsBqTIBloO8WPAVy8U5PgAX
	sOeaiprh1VeeW+rN792bCp8hfQvqdBdrECnClvZ171KoxcZTfXJFMZ5khA02+UuFMOrb
	gFZqP+RpK99SbukXkqrEwjHgwSqtm0O6zLtidRKO+SU2wMps+OSweRQC3+AEqPaMq+G8
	gcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=cM53TFy+cLxuAVp+u99gBNQH0UQPiHbTPlBKpdnp7e8=;
	b=Y7xOEP8tx5/CbnALxTOFXCUINuodFrgnH17VI7KK39I1REbAG9K5AZ6Zle1joprhxF
	/2gyoaEy+VKUXKu9V/BQ4dQNDfXcBwMFgGwkfa8k0U6oyJhffrGB8ItBRuWoU7PYFLjl
	Ops4IPs+nbBKi1OD300qVn0Lm28DVzSRii5xXedo0i0gpsXN9t9WhXkxXNn024zOu/pT
	OYuvO+0WA5NAiI2Ld04cP3m4UzJZYjacM7KvrG7BjJgxi4fZwBSzzZm59KlO35JyY1e6
	ffLnaBfUi9SmjP6s6UL3VqBZV5aOYP8Ygg/qp6yRox3IvjT940rKi6xJwps2+33rojn4
	ocGA==
X-Gm-Message-State: APjAAAVHx2rTUcPSSPEG0QYlK9gQHqCbemoVkMyp2pD1SD1c3Ctg5rwc
	961TYMfupZCmQ+aeh9MAdyLoZqftGQg=
X-Google-Smtp-Source: APXvYqzHSQerxUooMq92BVnN+0DIwngNkW7/wCnuHXmE1nEIJC98tzGCvkLnqbfHu9itmhv5KHcxVA==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr4588408wro.206.1556382563905; 
	Sat, 27 Apr 2019 09:29:23 -0700 (PDT)
Received: from x1.local (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	s12sm24733986wmj.42.2019.04.27.09.29.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 09:29:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 27 Apr 2019 18:29:21 +0200
Message-Id: <20190427162922.4207-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-trivial] [PATCH v2] hw/sparc/leon3: Allow load of uImage
 firmwares
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
X-List-Received-Date: Sat, 27 Apr 2019 16:37:51 -0000

Currently the Leon3 machine doesn't allow to load legacy u-boot images:

  $ qemu-system-sparc -M leon3_generic -d in_asm \
      -kernel HelenOS-0.6.0-sparc32-leon3.bin
  qemu-system-sparc: could not load kernel 'HelenOS-0.6.0-sparc32-leon3.bin'

  $ file HelenOS-0.6.0-sparc32-leon3.bin
  HelenOS-0.6.0-sparc32-leon3.bin: u-boot legacy uImage, HelenOS-0.6.0,\
    Linux/ARM, OS Kernel Image (Not compressed), 2424229 bytes,\
    Sun Dec 21 19:18:09 2014,\
    Load Address: 0x40000000, Entry Point: 0x40000000,\
    Header CRC: 0x8BCFA236, Data CRC: 0x37AD87DF

Since QEMU can load uImages, add the necessary code,
so the Leon3 machine can load these images:

  $ qemu-system-sparc -M leon3_generic -d in_asm \
      -kernel HelenOS-0.6.0-sparc32-leon3.bin
  ----------------
  IN:
  0x40000000:  b  0x400007a8
  0x40000004:  nop
  ----------------
  IN:
  0x400007a8:  save  %sp, -136, %sp
  0x400007ac:  call  0x40000020
  0x400007b0:  sethi  %hi(0x4000b800), %i1
  ...

Tested with the following firmware:
http://www.helenos.org/releases/HelenOS-0.6.0-sparc32-leon3.bin

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Fixed GIT_AUTHOR_EMAIL
---
 hw/sparc/leon3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 774639af33..0383b17c29 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -193,6 +193,10 @@ static void leon3_generic_hw_init(MachineState *machine)
         kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
                                &entry, NULL, NULL,
                                1 /* big endian */, EM_SPARC, 0, 0);
+        if (kernel_size < 0) {
+            kernel_size = load_uimage(kernel_filename, NULL, &entry,
+                                      NULL, NULL, NULL);
+        }
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
-- 
2.19.1



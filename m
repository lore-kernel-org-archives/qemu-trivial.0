Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmeSH-00015v-DL
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 07:50:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSE-00011V-KN
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSD-0000zP-Be
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:58 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:51431)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmeS5-0000rk-GR; Thu, 24 Jan 2019 07:49:51 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M3lHZ-1gmvhA0O2d-000wFW; Thu, 24 Jan 2019 13:49:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Jon Diekema <jon.diekema@ge.com>
Date: Thu, 24 Jan 2019 13:49:04 +0100
Message-Id: <20190124124906.16653-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124124906.16653-1-laurent@vivier.eu>
References: <20190124124906.16653-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6QICfGEk2DwAbqWYsK+ZlND/rR9YBFjeGen3fCdzF7uCkWxwPAr
	Q4bceXqJItdHqqMbokHDTICRG8HgfgY9+n6YDbpOPlVz53BW62SFXzYwoLF6RYNUGfXJFQx
	WuI8Z7g0AWMuo4cyg0RAVI0e96ItdNA+cedIgC+WT/VuSiXPGd0Rpil45Gxn481xXF/u0J9
	/8JLpinQl1wTQJVS7E0Dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:56wQ0EH/nwQ=:mvH9nKamZvJrTJtCS+4UqX
	egqUO9K4CT33VnChpjtFcy5rCBJpH7S2jPb3d03u+EbX9nzWb5D7WHXZRJICzieKrrBqafWOJ
	d77vE0VN4vwc27KgnRsxrqcJRG+9bm7jws4p4v9WOThnEBDnd/iv4B4dg7D69yOIZ7I5YvaQF
	r41noxEHABuNJgLKgLu0/hRmylyTq0AxNTYxcXAN8KfTaw/n0E5/lyY4GKQdGEtf+Y6tOExGT
	DF9yL5wqIRU6wPG2SeAMbXy6XkxmkgM3TFymiNPqXipq6oIzhoGKxWNOe+amOyZmNFvwi0efB
	waFlTqvqBdfABguhB3qEeE7p8YNBsNFhKNrDEuo5qADtG18l6sWzaxR1PpYcvQUvqZ1QbP4ha
	iFeCIGcnQEBEAkC8ZPvS2ehUzp2MBamaBlgAXbSjFjl+0rOgu1TPh3hF+4PYITVSLYAXeyBBg
	DluMpdgluXWYnGOD0TmPJvqj8bQdYNOVa7ulisKsbqQhRhwdWQ4sj/9nKqZ5hqu7ohYbZD5Uu
	o0THaNArZIXc8RR72lZe01oEWll7JRtPpBTKFSqgJMqF7g3swkufz/9G4LOFPM/TdR670RQPc
	Ah6llD1BJWfybjgMvr0hn1zB9RLPwS4VbTuYXLQCiWqmCDYkJ+NL8u97HSE2wKNXBrj5CksOj
	NsEPHW2Xy0FY5TJUrykzZ9gkWJ433eM9F/D61usyYTGCJ8qR0IShHblayDU4LRPk6yQIfg1Xf
	0QafHq/HTHEPqOcfV+4pw91RJ4PwX+0EzFwu/g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 3/5] ppc: e6500 registers SPR 604 twice
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
X-List-Received-Date: Thu, 24 Jan 2019 12:50:00 -0000

From: Jon Diekema <jon.diekema@ge.com>

When using the e6500 CPU, QEMU generates a fatal error after
complaining about registering SPR 604 twice.

Building and testing with commit
9b2e891ec5ccdb4a7d583b77988848282606fdea shows the issue:

qemu-system-ppc64 --version
QEMU emulator version 3.1.50 (v3.1.0-456-g9b2e891ec5-dirty)
Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers

qemu-system-ppc64 -M none -cpu e6500
Error: Trying to register SPR 604 (25c) twice !

Signed-off-by: Jon Diekema <jon.diekema@ge.com>
Message-Id: <CALvuzg43uSodseEHjNaRcPFBKKPTY2mcppUbYgiLL=QO9RxX_Q@mail.gmail.com>
[removed duplicated mail header in the commit message]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/ppc/translate_init.inc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index ade06cc773..59e0b86762 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -4947,14 +4947,6 @@ static void init_proc_e500(CPUPPCState *env, int version)
     }
 
     if (version == fsl_e6500) {
-        spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     0x00000000);
-        spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     0x00000000);
         /* Thread identification */
         spr_register(env, SPR_TIR, "TIR",
                      SPR_NOACCESS, SPR_NOACCESS,
-- 
2.20.1



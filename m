Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLtC-0002Ms-Cz
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt9-0002Jm-FA
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt8-0001hZ-CT
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:43 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt8-0001hC-8K; Tue, 18 Jul 2017 02:21:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id l55so1330195qtl.3;
	Mon, 17 Jul 2017 23:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xwiYAukK/ITgzQfU6Waw2eTi9mvd0X0KgIEzG5BqGSk=;
	b=KisBxcLsWbVWp9ASfrwAcaLIJNrya05XlioVqQFtAacwcbumZRZfES3lEaUl80DMpl
	6T6Vj4Bqld4OjoHT91kE/zbGRNTDAFzQxQUOGtoNJhvfJnWmdJ68yCGfSA3dOcXquTlq
	eOXFWzzKZdfp6yaD096nPX2TeDwE12qv5i0Q2MM/GUrFsEf92VTyM1uTihQuKFqXpiqR
	u0MnDKRnVuI5DZ43iwkl02WkK6Longp3yThM35OhB3EnlihcLSgRAb4CcDZwvFne8Z+m
	012MwgIFjkgs7nzv9HHiM4ee2TDl8fXCDWOGArXXy8txs7K723OZYaZfV1l+s/jo89oR
	5jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xwiYAukK/ITgzQfU6Waw2eTi9mvd0X0KgIEzG5BqGSk=;
	b=Gd6crRjkS4lGyoF+qYawl6MkBA+ErlCJiEIRw7YzJlShnl8aKsdXaKJmsp1yviVf57
	0JZcF3++AAQt802f/he1hjKvM3fKrRcmBmPgcLcpfvN2lIKrLUDYXkDatTZ5AbfDI8Bb
	bV9diFmzZYrSS7yxMYpRwRvcycOn0+FZ/cnryw+i9Z+bgw00hLPngAR6zMfa8pMbemyO
	KZGfo+c4pEkyYg7ZfRpMGwY0CQ/95x3ykrQhZTo4zLMBDdZyUbNgi6PkclSG+6f9gTDf
	F4N82JcTDH/hZel1gFTe6J2wJpgpN0g5a/RFwP0wQ0C6RCpWBUZtyh2M31oqT8mcl1dP
	ZwYA==
X-Gm-Message-State: AIVw110c99i6cKwiQ1a1Alohwnh7zoMU8U6vJv3Wy9RGASiYfiNWl5F6
	ekKQ7boyHVW09+FCzTZvzA==
X-Received: by 10.200.46.118 with SMTP id s51mr179309qta.48.1500358901656;
	Mon, 17 Jul 2017 23:21:41 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:10:02 -0300
Message-Id: <20170718061005.29518-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 26/29] tests/tcg: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:44 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/alpha/test-cond.c | 2 +-
 tests/tcg/alpha/test-ovf.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/alpha/test-cond.c b/tests/tcg/alpha/test-cond.c
index 74adffaa69..e5596f10b8 100644
--- a/tests/tcg/alpha/test-cond.c
+++ b/tests/tcg/alpha/test-cond.c
@@ -77,7 +77,7 @@ int main (void)
 {
   int i;
 
-  for (i = 0; i < sizeof (vectors)/sizeof(vectors[0]); i++)
+  for (i = 0; i < ARRAY_SIZE(vectors); i++)
     if ((*vectors[i].func)(vectors[i].v) != vectors[i].r) {
       write(1, "Failed\n", 7);
       return 1;
diff --git a/tests/tcg/alpha/test-ovf.c b/tests/tcg/alpha/test-ovf.c
index 01c80e7525..43fc6ebb2e 100644
--- a/tests/tcg/alpha/test-ovf.c
+++ b/tests/tcg/alpha/test-ovf.c
@@ -20,7 +20,7 @@ int main (void)
 {
   int i;
 
-  for (i = 0; i < sizeof (vectors)/sizeof(vectors[0]); i++)
+  for (i = 0; i < ARRAY_SIZE(vectors); i++)
     if ((*vectors[i].func)(vectors[i].a, vectors[i].b) != vectors[i].r) {
       write(1, "Failed\n", 7);
     }
-- 
2.13.2



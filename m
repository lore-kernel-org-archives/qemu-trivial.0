Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAMzb-0000G5-Fx
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 18:30:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzY-0000DC-H1
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 18:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzQ-0002iK-Vc
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 18:30:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzK-0002dg-9X; Wed, 10 Oct 2018 18:29:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id 63-v6so7437168wra.11;
	Wed, 10 Oct 2018 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UDbIoAji9yRvj4PmN0OxS0ZP7RJ1XZcNZcBQ7P7BPgk=;
	b=IWvS19ZzhXIi/XZh7SqeDdJ9ksndAcp861Xrs8PW9MCcfT89qxWQKcfk9qY8qXdwNI
	BWKIPL9lgqzfWlUV8+SHcDtKRF7AEQTlKYZJ/OEK1pAYftlZF0coz7bRzUKj7eZbqfx6
	9RvexYkXMT/lmf5pamEnPIz5ognWgmyxjbVuWAr0ATWN0IBLTsnUjUeoJ89eA/ATxqcy
	v6rwl4zFXWs+PmyVSJDDWJDqaeJ/q7OZ189STITB4LqNz1D/1mQCIMAqiGbFVu2cgBgo
	mK+7NX6iyiwjKKji4x3gkC0HTL11STHpFAVxkJ3nzkuYtcuIG4YKBQt0qpeHowwcGqDw
	IxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UDbIoAji9yRvj4PmN0OxS0ZP7RJ1XZcNZcBQ7P7BPgk=;
	b=jzkWcsqju5mT+ecmbROoL01yDMqZ4wx9R5LjdylQPf2diy0R4+2G86uys+FlCCgs4g
	t0LuJ1SrBKwaYtSPeqWbTingwvdz2QhyQ9z49E79HuKNuPH86hCazkE7ygcISRHgq8Ej
	7sSIk4g9AYHIYvzaaXmZ1eoAraEigPlP4+x/W3h2R3CjugjFJcc2jeMIyl24C/uggX1K
	DzeXJojZx319Qw+X3CuZQxD7VYnzjP5rBXkXFU3UDIMcy9OYjGtFneyo2qs5JDBKoz3p
	6CkhWVgfJdIyhIIH6QHjO57eLRfEwy3JQ4ft2oB04lFGOy5/MPFiuxFQwJaOIJkb+7XF
	eBHw==
X-Gm-Message-State: ABuFfogRi/impLvLU7L0dVx+Ir9ubAaPz1xyzXMFpB326GgdeqFw0m8O
	9AnLFSruJN1BEf3rNV0tXtc=
X-Google-Smtp-Source: ACcGV61LFZ034NVCFezDFQ2SFXyGEHrE9Z5WlP7SHXUMDGCyzt1x38SbfOTAYWP+hw8uFcpagmcN7Q==
X-Received: by 2002:adf:e808:: with SMTP id
	o8-v6mr23923545wrm.269.1539210591517; 
	Wed, 10 Oct 2018 15:29:51 -0700 (PDT)
Received: from x1.local (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	c64-v6sm13787447wma.44.2018.10.10.15.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 15:29:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 11 Oct 2018 00:29:44 +0200
Message-Id: <20181010222944.29304-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010222944.29304-1-f4bug@amsat.org>
References: <20181010222944.29304-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-trivial] [PATCH 2/2] mailmap: Split 'prefered emails' from
 'original git import' section
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
X-List-Received-Date: Wed, 10 Oct 2018 22:30:09 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/.mailmap b/.mailmap
index 6f2ff22a45..8475adf799 100644
--- a/.mailmap
+++ b/.mailmap
@@ -4,26 +4,31 @@
 # into proper addresses so that they are counted properly by git shortlog.
 Andrzej Zaborowski <balrogg@gmail.com> balrog <balrog@c046a42c-6fe2-441c-8c8c-71466251a162>
 Anthony Liguori <anthony@codemonkey.ws> aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
-Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Aurelien Jarno <aurelien@aurel32.net> aurel32 <aurel32@c046a42c-6fe2-441c-8c8c-71466251a162>
 Blue Swirl <blauwirbel@gmail.com> blueswir1 <blueswir1@c046a42c-6fe2-441c-8c8c-71466251a162>
 Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl <edgar_igl@c046a42c-6fe2-441c-8c8c-71466251a162>
 Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c046a42c-6fe2-441c-8c8c-71466251a162>
-James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
-Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@mips.com>
-Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec.com>
-Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
-Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
-Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
-
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
 
+
+# This section is to track prefered (or last up to date) email for people
+# that uses (or had use) various emails.
+# Example can be people changing from companies, or companies changing their
+# name.
+Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec.com>
+Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
+James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
+Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
+Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
+Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
+
+
 # Next, translate a few commits where mailman rewrote the From: line due
 # to strict SPF, although we prefer to avoid adding more entries like that.
 Ed Swierk <eswierk@skyportsystems.com> Ed Swierk via Qemu-devel <qemu-devel@nongnu.org>
-- 
2.19.1



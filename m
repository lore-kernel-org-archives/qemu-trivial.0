Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbn7i-0006Gi-TL
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2018 08:51:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1gbmDo-0006po-75
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 07:54:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1gbmDn-0004sE-Eq
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 07:54:08 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>)
	id 1gbmDh-0004ks-2E; Tue, 25 Dec 2018 07:54:01 -0500
Received: by mail-wm1-x341.google.com with SMTP id m1so12890481wml.2;
	Tue, 25 Dec 2018 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cH4+SY/Crqnq3Wvkn0fIeaz6uG1O9YvFEUCWKwpOK1E=;
	b=iGCZjtk89Q/nKSqEiG5gooNBx7kKY+02xLgMqa8h5n+ZFOK8GXN2oMYulAOOw2QXfG
	kur3QpOFgtmmAMe+RqCaUf8qth21LAWnlfaOmNo5D/PPydlqS9GTXsDS+x6j+BPyBoPn
	D0Aeg8JHn7McZWwN1ZxEuewBbY6OB/fZHZy941FOv/XFd3iOLrWioMKfZjF0EBOTUOqM
	EwsmApG3tQkoR2wK0mUP7Vl1HxOR7tB7K81zoMMk5UzgB7d3UNsiSfvi++U6BAihhyTa
	OXVpx0OTO/UZss6hTdiyR0YbQULC4cTbwYTG7O8DSZYy8YfjpOxKMa4nk+2b+w6JsGGU
	i4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cH4+SY/Crqnq3Wvkn0fIeaz6uG1O9YvFEUCWKwpOK1E=;
	b=ancMREKciI/5Yw84GlEIx33AO4L1Ttnv+y9QOcCpv+/gqGKHUSllHoPh+INC7JjmO2
	Mtn91grnJYc+a0mqRZDwf4gRu4JqY9r9khdCHpG4K2WYKLjrEnjLS50AIB59J1yD0XFa
	GMghA4YXitCbyXfvFk1Jm1p0jdmgv9AZKXUmGlO7iuc0SylFXuqEfdWnaa6SbFAkbsuk
	po29bv+jnqrkUGh/5sIoCESNlSCQEKv3VdQ+/USFtd/wBBER9tZIPBk10igq4s6LKjmu
	X7uiihnCDE6UVRSOWAhFFRRDa7ih3sLv2eFYG0PyK72P+JukJvv0XPx8u9ehZMb0+LtE
	BBew==
X-Gm-Message-State: AA+aEWaN2dzoDOiaYbcmQLIQQGbyCuDZvJfxZyqjorW9VCrSAC9XULfm
	ILq6rtuWF4u9zM25qIiTPZIz6Iqm
X-Google-Smtp-Source: ALg8bN63hd/YX0kJgbc598Rc2eGGwxvRy0UlAew1cQXZ894FQsMxUEbfc7VyROV7Y5A82InIE3NZpA==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr14741104wmd.63.1545742439545;
	Tue, 25 Dec 2018 04:53:59 -0800 (PST)
Received: from linux.local ([82.166.99.178]) by smtp.gmail.com with ESMTPSA id
	j8sm16425656wrt.40.2018.12.25.04.53.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Dec 2018 04:53:58 -0800 (PST)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com,
	Jon Doron <arilou@gmail.com>
Date: Tue, 25 Dec 2018 14:53:44 +0200
Message-Id: <20181225125344.4482-1-arilou@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
X-Mailman-Approved-At: Tue, 25 Dec 2018 08:51:52 -0500
Subject: [Qemu-trivial] [PATCH v1] dump: Set correct vaddr for ELF dump
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
X-List-Received-Date: Tue, 25 Dec 2018 12:54:11 -0000

vaddr needs to be equal to the paddr since the dump file represents the
physical memory image.

Without setting vaddr correctly, GDB would load all the different memory
regions on top of each other to vaddr 0, thus making GDB showing the wrong
memory data for a given address.

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 dump.c                       | 4 ++--
 scripts/dump-guest-memory.py | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/dump.c b/dump.c
index 4ec94c5e25..bf77a119ea 100644
--- a/dump.c
+++ b/dump.c
@@ -192,7 +192,7 @@ static void write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
     phdr.p_paddr = cpu_to_dump64(s, memory_mapping->phys_addr);
     phdr.p_filesz = cpu_to_dump64(s, filesz);
     phdr.p_memsz = cpu_to_dump64(s, memory_mapping->length);
-    phdr.p_vaddr = cpu_to_dump64(s, memory_mapping->virt_addr);
+    phdr.p_vaddr = phdr.p_paddr;
 
     assert(memory_mapping->length >= filesz);
 
@@ -216,7 +216,7 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
     phdr.p_paddr = cpu_to_dump32(s, memory_mapping->phys_addr);
     phdr.p_filesz = cpu_to_dump32(s, filesz);
     phdr.p_memsz = cpu_to_dump32(s, memory_mapping->length);
-    phdr.p_vaddr = cpu_to_dump32(s, memory_mapping->virt_addr);
+    phdr.p_vaddr = phdr.p_paddr;
 
     assert(memory_mapping->length >= filesz);
 
diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.py
index 198cd0fe40..2c587cbefc 100644
--- a/scripts/dump-guest-memory.py
+++ b/scripts/dump-guest-memory.py
@@ -163,6 +163,7 @@ class ELF(object):
         phdr = get_arch_phdr(self.endianness, self.elfclass)
         phdr.p_type = p_type
         phdr.p_paddr = p_paddr
+        phdr.p_vaddr = p_paddr
         phdr.p_filesz = p_size
         phdr.p_memsz = p_size
         self.segments.append(phdr)
-- 
2.19.2



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiOif-0000VT-TH
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 11:59:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiNNr-0005z5-7S
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 10:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiNNl-0003BX-HP
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 10:34:11 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:33744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1aiNNh-0003Ao-BY; Tue, 22 Mar 2016 10:34:01 -0400
Received: by mail-pf0-x242.google.com with SMTP id x3so36525271pfb.0;
	Tue, 22 Mar 2016 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vj1H7AGUeVBxO5gwaaPPFK8+mTdpWoWzbiAe7B+IM9o=;
	b=Ypf/EiZvQ8cH/VoDKDcSB5boLLPmElbaR/K15JW1wweKyLJOAoYBeXdaI79Zxb+G3Q
	cOoYAv5NkrywtBj1F6pzx9mVKpCxwTmPTkaOr7UPVI1U6CkGdvtZZr81VKxii0DDqJhI
	RvoiACsWRcWydYxSRpHJDflGSH5Zc7lMmyEb4HeHEjJ+5cCv6OjUzr63UHgD6P22Tv68
	+XCJ/bACS2U05/M9FC6vVocU500GTFTbqPmaX5G5T/t3yUfB+cXbwG0qI4L+pLQmvn3o
	/UZGMJ+hATG46QrbAkGjGY63a+THukTFwkWZHabMIqb+IndHUnmuCv5dlVWl01q3ls2l
	DkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vj1H7AGUeVBxO5gwaaPPFK8+mTdpWoWzbiAe7B+IM9o=;
	b=aAQrPTA+pSu/98M5cSeT7ea7WrSZ1hSuNlx7KOIFjW9iCvw3I+idPiIZgG6TUZe2jO
	RkF4zeAuSlcqgVdsO9qVpMDbuVNRbX2KgSGWmGjGALgFfCzQIsNp1gYNqEyMfK0ueVg7
	aBR/sQDdzItaOndKGjE8pHhpnd1nnxBvEUC4aDVSsWvBNj2GPPJnJBXfYzANws5zafUo
	ZafApVHMU6YDgGj+b6TFptn14q/l36I8OSQkBJW+0KkqtwQ4E/l4zeJx1D6Hqxozs+cH
	G85J5pJui7Y1Pp9roCvgKlanjiHx0c/Q2XPhpIWLxP03sGHAq9u1C4rQhZ33eWo9gNA+
	5oKw==
X-Gm-Message-State: AD7BkJK+9Nz3QbKLmZ0Sm17jOFLbHlOKnB36OGx9G6qPQFfUgDB/eiSkNeeIi0egUSJFtA==
X-Received: by 10.98.89.129 with SMTP id k1mr54759146pfj.66.1458657240219;
	Tue, 22 Mar 2016 07:34:00 -0700 (PDT)
Received: from student-HP-COMPAQ-ELITE-8200-MT-PC.nitk.ac.in ([14.139.155.210])
	by smtp.googlemail.com with ESMTPSA id
	fk9sm48960658pad.9.2016.03.22.07.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Mar 2016 07:33:59 -0700 (PDT)
From: Md Haris Iqbal <haris.phnx@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Mar 2016 20:03:39 +0530
Message-Id: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
X-Mailman-Approved-At: Tue, 22 Mar 2016 11:59:44 -0400
Cc: qemu-trivial@nongnu.org, Md Haris Iqbal <haris.phnx@gmail.com>
Subject: [Qemu-trivial] [PATCH] Changed malloc() to g_malloc() at places
	where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 14:34:15 -0000

Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
---
 bsd-user/elfload.c | 2 +-
 bsd-user/qemu.h    | 2 +-
 linux-user/qemu.h  | 2 +-
 thunk.c            | 2 +-
 ui/shader.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 0a6092b..40bd1f2 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 
  found:
     /* Now know where the strtab and symtab are.  Snarf them. */
-    s = malloc(sizeof(*s));
+    s = g_malloc(sizeof(*s));
     syms = malloc(symtab.sh_size);
     if (!syms) {
         free(s);
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 03b502a..ada4360 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -357,7 +357,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
 #ifdef DEBUG_REMAP
     {
         void *addr;
-        addr = malloc(len);
+        addr = g_malloc(len);
         if (copy)
             memcpy(addr, g2h(guest_addr), len);
         else
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 26b0ba2..615b9b9 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
 #ifdef DEBUG_REMAP
     {
         void *addr;
-        addr = malloc(len);
+        addr = g_malloc(len);
         if (copy)
             memcpy(addr, g2h(guest_addr), len);
         else
diff --git a/thunk.c b/thunk.c
index f057d86..bddabae 100644
--- a/thunk.c
+++ b/thunk.c
@@ -88,7 +88,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_malloc(nb_fields * sizeof(int));
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
diff --git a/ui/shader.c b/ui/shader.c
index 9264009..43c6f64 100644
--- a/ui/shader.c
+++ b/ui/shader.c
@@ -83,7 +83,7 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
     glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
     if (!status) {
         glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
-        errmsg = malloc(length);
+        errmsg = g_malloc(length);
         glGetShaderInfoLog(shader, length, &length, errmsg);
         fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
                 (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",
-- 
1.9.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anQvu-0000ZO-Bh
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 09:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1anQvo-0000Sd-Ra
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 09:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1anQvj-0006VM-7r
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 09:22:08 -0400
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:35271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1anQve-0006Ur-Mr; Tue, 05 Apr 2016 09:21:58 -0400
Received: by mail-pa0-x241.google.com with SMTP id zy2so1287175pac.2;
	Tue, 05 Apr 2016 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xgJwUWV2kP/1F2gpk61Ezur4rDVecVGnnRoeHkYiVA8=;
	b=UOqns6ym4EINUO0rwR1iqmQ6fxZaaf1w/HJQ7t6TiOhUp2XiVdy+wkrlzsZhMd4gkn
	anK4jZe0PbMYdOL1+QnD0fwZmBlGAl0QbPW4M4nRK4llhQFXpY+8DXc7VYg0EUiFl14y
	2wd5oKHjgxEqC/W1Hgi9382fCIG5wHCb6RoRKJD2zTt9R+ynxEKeHrDcNX8HitZGwiE5
	oDazFUwU/EsRYHSulCq1n4z4O1xJK2dXAga71GyzBs4Q+gyIdHc7jzKMR2P8z18Qubj8
	a7uuTrMDLCIGJvJn+rMbSvvQ4E0w3lQ4+6G1s2XwlxN3M9KJAWlEp6499A4ULPot+PE1
	vpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xgJwUWV2kP/1F2gpk61Ezur4rDVecVGnnRoeHkYiVA8=;
	b=fEt/qW8mWmSdESB7s0RGcAOM+xMScYlliQZSl4Y+Vwv5D5Hl4D+1NRtBdEGTL7PsHF
	dIVZB17cSq+nYV6OFtGocp0M++FgX2DvOaXyjezH9mDpyCPgPT6MFPHqVGHTi9yNiyad
	aU9grnh+nKho5nABS0pXrQqjTkx5UkbaiTAhnj6din8j8SbtHwYErwxsjEPH3x+lk6Xo
	kxVYkLnQBmluirFOS3wA7//7bYocM7xIfMINUIfKcsFzThTx/hW9XRA6H4lL2Vtn5KbO
	A+gke3ilfwouOEEu/cHVbeRdSiF0zC1CbEGsqPL3i0o1m5z5kVRb8VFTuxbGKUYQWNPv
	IO2Q==
X-Gm-Message-State: AD7BkJKYIAzsyORY/2mMDX/79GVu0/sOxQlU/kudZinhxGMavGkLVeiOQblDJPZ7IIgdNw==
X-Received: by 10.66.141.103 with SMTP id rn7mr61657617pab.70.1459862517760;
	Tue, 05 Apr 2016 06:21:57 -0700 (PDT)
Received: from student-HP-COMPAQ-ELITE-8200-MT-PC.nitk.ac.in ([218.248.46.109])
	by smtp.googlemail.com with ESMTPSA id
	p26sm47026744pfi.84.2016.04.05.06.21.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Apr 2016 06:21:57 -0700 (PDT)
From: Md Haris Iqbal <haris.phnx@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Apr 2016 18:51:39 +0530
Message-Id: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Cc: qemu-trivial@nongnu.org, Md Haris Iqbal <haris.phnx@gmail.com>,
	kraxel@redhat.com
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to g_malloc,
	free to g_free in ui/shader.c
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
X-List-Received-Date: Tue, 05 Apr 2016 13:22:12 -0000

Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
---
 ui/shader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/shader.c b/ui/shader.c
index 9264009..1ffddbe 100644
--- a/ui/shader.c
+++ b/ui/shader.c
@@ -83,12 +83,12 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
     glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
     if (!status) {
         glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
-        errmsg = malloc(length);
+        errmsg = g_malloc(length);
         glGetShaderInfoLog(shader, length, &length, errmsg);
         fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
                 (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",
                 errmsg);
-        free(errmsg);
+        g_free(errmsg);
         return 0;
     }
     return shader;
@@ -108,10 +108,10 @@ GLuint qemu_gl_create_link_program(GLuint vert, GLuint frag)
     glGetProgramiv(program, GL_LINK_STATUS, &status);
     if (!status) {
         glGetProgramiv(program, GL_INFO_LOG_LENGTH, &length);
-        errmsg = malloc(length);
+        errmsg = g_malloc(length);
         glGetProgramInfoLog(program, length, &length, errmsg);
         fprintf(stderr, "%s: link program: %s\n", __func__, errmsg);
-        free(errmsg);
+        g_free(errmsg);
         return 0;
     }
     return program;
-- 
1.9.1



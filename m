Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6y-0001Kr-LI
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6w-0001IQ-Ei
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6v-0005t9-HM
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:42 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35995)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6t-0005qF-ED; Mon, 24 Jul 2017 14:29:39 -0400
Received: by mail-qk0-x242.google.com with SMTP id d136so10669133qkg.3;
	Mon, 24 Jul 2017 11:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=r4SmBG6aqSov+GTkrxTuziSft9NB2/8Kf7Nn7tgWLoA=;
	b=UETVGAKhedNolinXL22XREVvIGnQMxOJKDak71IWVBXyN5QzHQPpWkve5BXaKA03Zu
	6ESTVWbq67TMUnBzBX/x62s/T1du63m/BLYYX8vr7eqqw1V2ZdrNsmDg3E6Y8sjW/yJE
	sUVVXu9ZQxH+xJcj9dt93iIUe+TNn6RdgdnGktWtHbZdL/aOU90rnJJAxIAukv2rIKXL
	Qr8DBjDV5H4TeNE8gCjjFWXpFoIKT83ZoU8qLYemeSiyp5WTPOWFRskjB8t05Hq43O60
	03W2wiXSsPzROEaucqWcfggAzZzXl85AAFYneq3f82cEO2co/GBBm42TCSosrT589sJ0
	GtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=r4SmBG6aqSov+GTkrxTuziSft9NB2/8Kf7Nn7tgWLoA=;
	b=ic4T/jf1qEwfQHpoZ9d2R3Ol823oJs2MT9sVSu9aewKgbAEdkrsDAX0SaqniT9XMst
	ineYe6gNfkPCoiHXfGLDjNRahV6e/5jMmyUxynMVaUGQQtn32NCevdJVv+BYsgrsPefD
	UfpE25SizGhSWHtSb7G0CNprtIyp1WNCvLXimJSPEkCi2veedvFMS6KdCgO9+x1Oknag
	TgB4SuoNq64EzuAhkhIWtwagtOPZBPG0xOpJIlz9eA+uR/vLH94VMJ1uh65yAQSPaiGU
	e9/LDYR1IxhRdvvwjftLlwAX3VH6QgrPmyY3MNu8aw2RBNBgWQsNXl8rmC3FNVOhj4Sq
	MNyQ==
X-Gm-Message-State: AIVw112qzgdyAxki2SJN/+uYtHzkOVXnu3VDDC46zK3qDP4TgSOtIP/M
	62xfIc3QQ/WHqA==
X-Received: by 10.55.158.12 with SMTP id h12mr20096792qke.258.1500920978927;
	Mon, 24 Jul 2017 11:29:38 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:47 -0300
Message-Id: <20170724182751.18261-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 31/35] syscall: replace strcpy() by
 g_strlcpy()
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:43 -0000

linux-user/syscall.c:9860:17: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                strcpy (buf->machine, cpu_to_uname_machine(cpu_env));
                ^~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 963b9c8f4b..847f729834 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9853,7 +9853,8 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
             if (!is_error(ret)) {
                 /* Overwrite the native machine name with whatever is being
                    emulated. */
-                strcpy (buf->machine, cpu_to_uname_machine(cpu_env));
+                g_strlcpy(buf->machine, cpu_to_uname_machine(cpu_env),
+                          sizeof(buf->machine));
                 /* Allow the user to override the reported release.  */
                 if (qemu_uname_release && *qemu_uname_release) {
                     g_strlcpy(buf->release, qemu_uname_release,
-- 
2.13.3



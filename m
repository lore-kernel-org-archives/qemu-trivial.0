Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cT5-000305-4i
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cT2-0002xv-R2
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cT2-0000K8-8d
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:44 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:56021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSz-0000Gw-J0; Fri, 06 Oct 2017 19:55:41 -0400
Received: by mail-qt0-x244.google.com with SMTP id x54so34283607qth.12;
	Fri, 06 Oct 2017 16:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i/6EaQU2DazTGsvn8FNKLl7F6RqsZbNvTIFrOmOr+EA=;
	b=DVxtH/xiU5Dznj7amLB6z0IbMAVQn2YDqTE3B2S95ekFanJxgeoAYqlglpYgsI+a3s
	Yo/R9bYnHXeOgcwm4mByU7/Qdq923403+nrSLuGhQwXptG/wmnB0GRFAqyih3y51FAQt
	22x6TLORJw3WuTdUvwvr0IvfH/pR8rZzxXJNpReLSaEI8S3UE4+cjjiVeiWgY+XNtme+
	zyp2lT6L9nMaXIn6YuAzYW+cli0ds10bkcYGNwMxFNboIWJ/ybiJULCUcUBnxZ6lgG2w
	rx9pZAgevf+vZhKHGWVUcsZvJNv/NxMDVLNhjFLgjcUfQMb3IYwLb7Ql/WHTxrmKInE1
	Nqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=i/6EaQU2DazTGsvn8FNKLl7F6RqsZbNvTIFrOmOr+EA=;
	b=C28Hvh++pZIMX5vzVfu15dn9w6fgPd68Z5YODBCD3QiDZWPWbQqSg7qPZO329uOwK0
	7qHkrNf+Rnd4L55RafEf3Qj3OAQtjpFFqWVHN7GTv2q/mNw7+fmuFZAvjRj0B5BZ2LhI
	n4A0IgHg8bgkupRYQ2d2fE+sshg6KHgZZyej65bGbmxOPU8DDjB2mBObLuCuqdF+Wlrd
	xuvjZZ8MhyTk7UpRAPkPCtJ/8gSTiCtEP51b1+UTses+8xOqxE+kGgk1OVdp4MmM5pjB
	2KNe5qppzfP2SJNq9THayUwaTfE+YwaTdJeUuXjkTv56zbtfIc0wGqAUqS0Ns2xHSfOI
	gPYg==
X-Gm-Message-State: AMCzsaUbq3LxW8nHhN/91iTWFV3g476m11xbnGUMOzAycEoJDZ3fRPAu
	XjE+S0akoMrB316uhnUrjWw=
X-Google-Smtp-Source: AOwi7QAI8uqct77/jThLrx9NW9BUALSl9HIU8yyzuIQqjXdzELTSlXlWes2jHz8CeYAUaBDsHS4lbw==
X-Received: by 10.200.33.235 with SMTP id 40mr5333862qtz.185.1507334141090;
	Fri, 06 Oct 2017 16:55:41 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:23 -0300
Message-Id: <20171006235023.11952-89-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 88/88] scripts/coverity-model: use g_new()
 family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coverity-model.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
index c702804f41..de07bffb57 100644
--- a/scripts/coverity-model.c
+++ b/scripts/coverity-model.c
@@ -363,7 +363,7 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
 typedef struct _GIOChannel GIOChannel;
 GIOChannel *g_io_channel_unix_new(int fd)
 {
-    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
+    GIOChannel *c = g_new0(GIOChannel, 1);
     __coverity_escape__(fd);
     return c;
 }
-- 
2.14.2



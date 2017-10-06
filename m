Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSL-0002Gn-LV
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSJ-0002EJ-QU
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSJ-0007zH-6N
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:59 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:47289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSG-0007wh-VF; Fri, 06 Oct 2017 19:54:57 -0400
Received: by mail-qt0-x244.google.com with SMTP id z50so29317584qtj.4;
	Fri, 06 Oct 2017 16:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sF5UHJotnEoBCp34Be3hjw7Ud6Krvr/9RbpLjCV0RJI=;
	b=uI5HCHYx+XvD6/2seoYsJo2FeGRSUcc9GHCmAQFR/9cqEyHS4whG0h/Lo+3/Xfa6Zx
	y5Wb5imzjxhC/wpHoQ9sKhgGzWcQMjOOzmSUciJVo2Vkh7HSR+rlXNqgKhIsNEce/R0H
	Z4I0HUfayitR7AoPzKCsN+4Dyk5HMfFqdzHqtmaRG7u+51p5HYkDAP9qtu0tTx9e66Fa
	Ky3PzMgtgxnuIjQqtI3BRNPIorB6pQX02ObwRFrcb3+KkZ/Vv8kGnDYccgGEMzDsc/4r
	v0VKJIqpOaDSSqYl97u6sujKnPp1piAOlmgKN//wG4yf5nJHdjhM3IUx0NyXqiscIbeo
	dcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sF5UHJotnEoBCp34Be3hjw7Ud6Krvr/9RbpLjCV0RJI=;
	b=gWvgPp16nx7kH/Rp7/Ll9/BQ7ZDEeToEj3HxBDYe24ePswwgNj0Gd2HHIr8S0PeCTI
	ftzpqfaSoAaNY6XPP6mPF1ZaGKdUjm7fG1RKRvJtrTzGG3nbAx01sgK2eo4+gBNK/bfe
	EEubZ/rt3Tcm4KH0I/COBZo0tdK+gsmGLhOKfrIVPTBGGO9BL49en2r0OKHLDEFey9+7
	PLBhfQQ2ZVuDBr9OmqQLwwxrTvCsproyfNrUstxIccdRKBupLyqJZ6fizVJb9nYgpaDp
	F+06klDbhEFzndGMdWiWcO53hfHCdWtCfljcgct2leKD3HxgWzZc9qeZAGv8xcrQ6eCq
	muvQ==
X-Gm-Message-State: AMCzsaV93GzduZYcho1ctZ9EaMqGWND17c1w9BdTGA1Nuv+g0U76F9/U
	1yLb0C25Duwu4ntNDE9wX7Q=
X-Google-Smtp-Source: AOwi7QDOeEnHWtuD8GRCF2DPpGJFnPXBJXrG2lzMsc6X58VKL4m+YO15nJxRxeS0XlUESnoWVIK5bg==
X-Received: by 10.200.22.231 with SMTP id y36mr5546807qtk.31.1507334096461;
	Fri, 06 Oct 2017 16:54:56 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:09 -0300
Message-Id: <20171006235023.11952-75-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 74/88] balloon: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:00 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/balloon.c b/balloon.c
index 1d720fff81..d77918fd37 100644
--- a/balloon.c
+++ b/balloon.c
@@ -97,7 +97,7 @@ BalloonInfo *qmp_query_balloon(Error **errp)
         return NULL;
     }
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(BalloonInfo, 1);
     balloon_stat_fn(balloon_opaque, info);
     return info;
 }
-- 
2.14.2



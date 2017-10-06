Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cT6-00031o-Vy
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cT2-0002xJ-3Y
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cT1-0000Ip-Dg
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:44 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSw-0000F3-Rp; Fri, 06 Oct 2017 19:55:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id 17so5921231qkq.5;
	Fri, 06 Oct 2017 16:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8c7UQTAh9LncmhfNgIt240iZOVslV3OpF0A8DvzglnQ=;
	b=L/UnPKNWFARH8mk7+zBDwc4zXwkN+ytvg2sbrFluO5CZsvMpkWrDC/lISxZN1eMW/Z
	LfhtVoyujHRbFS5aURkEEWCX0um9ZOJLDS51iw2YlJgMUaojpju6df5WfF3QAwbP25jk
	ga6uGZNWBU/fBBCaosZ3g+kkL55qnZSkk2eqeURImw5VoYb1fTbFGei5ICUZGJ9C9o6Z
	+tTky19UXhebQHQqZEIXSN5H6J7fARsrUIo5EiU6ACAYmMSOqi64QanbSYKiBKcjDBRi
	DgPOjgehqI0BMhQXQB3EzD5J77pca7FrpcYRD1Y+3/iFtA1kEV5PX0lbiyJBXEv7D0Kx
	2h8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8c7UQTAh9LncmhfNgIt240iZOVslV3OpF0A8DvzglnQ=;
	b=g7vtUy/aJ0cT9QSy4vPDNVgF3zEAwN6xOaFJ6DdHdX7I331jVnaA6DP1TSdxzVuHFF
	Oyi3F3tTWIgrGA2QqBobFGFo47q2PAuj/jyyzdvzJxhLGnUlDDPV0VxcazG6tkI04eef
	BUu6yo43InDzhmGKbtBJzN+FXU2WP73n4Pa3kF4zDslaQde0C+MVM+M15GBzn1d0ekGx
	y4VruQTcdRabWPOXZO+MAAQcqvrp4PdHA5JHabZxG9X8QuAObIdVn4Y8TB3wjHpmbxZJ
	twyD6GcZg2Dk9Oj1dpVqQSYk4qppMhm15rWJlNF2fZnqbkvYch5csvYmgg8HkmkHRSav
	iBPw==
X-Gm-Message-State: AMCzsaUsmZzmgSyEm85NscltI2GWemRTsc01uK5kVIcJYmY3ATZMieEK
	q6RSBRVx7r0fGX1pC75Cmns=
X-Google-Smtp-Source: AOwi7QC+mZ397n0gMeBeTQjOk0icVgGnBjiN5U2mK/n9A6ybvWAiK8077V/4eHjk07jzmht+PfXDVA==
X-Received: by 10.55.22.38 with SMTP id g38mr735669qkh.98.1507334138316;
	Fri, 06 Oct 2017 16:55:38 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:22 -0300
Message-Id: <20171006235023.11952-88-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 87/88] hw/net/rocker: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/rocker/rocker_of_dpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index 191a58e0a7..990f4157a0 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -2306,7 +2306,7 @@ static void of_dpa_flow_fill(void *cookie, void *value, void *user_data)
         return;
     }
 
-    new = g_malloc0(sizeof(*new));
+    new = g_new0(RockerOfDpaFlowList, 1);
     nflow = new->value = g_malloc0(sizeof(*nflow));
     nkey = nflow->key = g_malloc0(sizeof(*nkey));
     nmask = nflow->mask = g_malloc0(sizeof(*nmask));
@@ -2478,7 +2478,7 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
         return;
     }
 
-    new = g_malloc0(sizeof(*new));
+    new = g_new0(RockerOfDpaGroupList, 1);
     ngroup = new->value = g_malloc0(sizeof(*ngroup));
 
     ngroup->id = group->id;
-- 
2.14.2



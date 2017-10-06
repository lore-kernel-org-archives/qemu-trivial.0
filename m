Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSe-0002bF-T3
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSb-0002Xy-Pv
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSb-0008HQ-3c
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:17 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSW-0008BC-Py; Fri, 06 Oct 2017 19:55:12 -0400
Received: by mail-qk0-x242.google.com with SMTP id z12so9702077qkb.0;
	Fri, 06 Oct 2017 16:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QDhExuv91uGcfDqPHtmFjgHyFpyHZRvwh51gJawyys0=;
	b=DeM1FfWw7nU8VjwQB768p3WC8ZhcBT8GnjFwDAJHcSDUyMb4/JBzQAGwqqJzng7Z1S
	t7C0KZTjRfZn0W6KmYv6SIlcLhoFt9T93JLu6kzfo3aE6m8swI9Lf+RcUwiZZ7GMLDlS
	/nMNv3A7Kb9z+7T/dFbwb6qhCAKZKv5TUedhu+6AClqZcb/u4ufxAndzGVwncOKuJiV0
	X0rksMm1K/A6zaHlKWxGNLV0cMR2ThVecDNxaHKI5R0SCvz/AvHjjRktM8shYLMO8a9q
	IWdDzzlEe5T6wkGRrZKAQgu2lUGNtsANwr0bAoEqjpTesU5xdBPl2emsYge+YFAgSZ5t
	NVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QDhExuv91uGcfDqPHtmFjgHyFpyHZRvwh51gJawyys0=;
	b=UW8GyVehIcm9sU9afsoXyykUJ37PJCQAe9/haNRuzM/izb0XIvi2HTkEoTEjwefG4N
	/a8K2al23fzZVXviWHstNhKD2uiTzXXtBIBEqk+ywEEZQ/Kmf26VJbveL2SO2z44PB6H
	IHRzlb23Ug8WOGjJLRL9ThrItzVvASJ+t/Hr+58Hm9m+9hhPuZ5UIbe1dOUBUv+sLHBp
	BbG4BkPSuzooa/EXdGtsuQdKtjj98Hh4zBwEPJRqlaKa0p7sYP3nSWHz8YzguFmfnm3B
	8vZJv/U5NQy0ImjPKS+rHQPnBIP6nQAwpSg9C9V5N4TlD4r3k8jg82dLL8AZPs/mmPMJ
	kZxA==
X-Gm-Message-State: AMCzsaXP8yePk4ShWohQLcXSe+2rBL5LgOr0RAmvYLpK7M591NVYezMl
	TPtwiasgxQ+VlamsOjM/IgY=
X-Google-Smtp-Source: AOwi7QC+XCeUkW3ZI0w2UdI6q7j5Qix1j+Pd0p5cKAoRGtAOUiPLZjgbUkUYB6iwSvHY2XuG6dsKxQ==
X-Received: by 10.55.56.14 with SMTP id f14mr742809qka.286.1507334112273;
	Fri, 06 Oct 2017 16:55:12 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:14 -0300
Message-Id: <20171006235023.11952-80-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 79/88] hmp: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:18 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hmp.c b/hmp.c
index 739d330f4e..5157ac4223 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1917,7 +1917,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
             return;
         }
 
-        status = g_malloc0(sizeof(*status));
+        status = g_new0(HMPMigrationStatus, 1);
         status->mon = mon;
         status->is_block_migration = blk || inc;
         status->timer = timer_new_ms(QEMU_CLOCK_REALTIME, hmp_migrate_status_cb,
-- 
2.14.2



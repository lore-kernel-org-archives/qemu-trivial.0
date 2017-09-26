Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwx4v-0003ND-O2
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 17:07:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwx4t-0003LS-Ak
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 17:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwx4s-0006KB-EM
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 17:07:39 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <carenas@gmail.com>)
	id 1dwx4o-0006I1-4k; Tue, 26 Sep 2017 17:07:34 -0400
Received: by mail-pg0-x242.google.com with SMTP id u18so7415731pgo.1;
	Tue, 26 Sep 2017 14:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AaoNomXxex+vXn9sAVRUHr4b0uZONb0jFeaTlBiWhk4=;
	b=mPZGiL7/ZQs+LTvD5oMWhDC1XfVQ7HrpfBzpGQtH+yXzE87N7F9MmkMdKJL3x1Sq4z
	KU/0f443zaRYjhZNVyBM3SODk2olQV1cYyJOGAzLgGNRvWZk713LvZlyoQU+dpKbFgez
	9PpwDJcSEpi4br5IgSG1VGJ1TtKO++8vAYQrrlJ2dWkDh1qmp0f0kLPY8kDTY7QufgD3
	zlIbLlegCKuyDDVfzprxg4BV4Fkxp9SRMrhByfZSRtOQLKf4wa8lPW/iffFTxTCQgh4y
	QYGuvJ+M7A9uPqN9hHn6sDhnkerDbBHqd44Smcl8Ruszfgf4lY5oUKFsaizEyQzo1GNp
	54pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AaoNomXxex+vXn9sAVRUHr4b0uZONb0jFeaTlBiWhk4=;
	b=aC2122K1jDUls4oDJdWJ9GQwzgCpnqX7vNayLS+rVU1GV9vLzY2T8DhmUEC4D+mQEK
	D2Qg7+OZTuAwodXA88AM9vvMmFZpZhLRS6UsQwqKQlqQaJYfdqUKzbMHq1aZ9i1SBHZY
	HoCAROg6BhPIZtn2iA7dzl41nwTC8IE2a/qJYfbx0aC1wssq5l2ZvpZrH124jlBbjQbh
	8EhHXzQcD1OGND8r6myxCdIokK3LeyBRflVwivLis/YE211vj0BYB/8oW4KGjjiCHeex
	r2h3L+uAL/j4iVt3k3wAO+/uHQ90TS5stFP9tz5Tee0KbUnSXSfdjg2O71Rbj9WwROhL
	SXmg==
X-Gm-Message-State: AHPjjUha6aKyQ+QHFyhu5r1hlNAhQu4es2BrMXBFL7Poft0Mtzanem8z
	7jol2BQQ7p3BegrCGBMeh79Av2T+v2A=
X-Google-Smtp-Source: AOwi7QCpa8+FkiKeh3yKPLI+DgrtPUk4HJc7JHHDMds15BnP1p6bTdgqBrSHfmwUsOcwsncWrNJJPw==
X-Received: by 10.84.129.193 with SMTP id b59mr12006540plb.121.1506460053010; 
	Tue, 26 Sep 2017 14:07:33 -0700 (PDT)
Received: from 172-11-32-171.lightspeed.mmphtn.sbcglobal.net
	(50-207-95-178-static.hfc.comcastbusiness.net. [50.207.95.178])
	by smtp.gmail.com with ESMTPSA id
	l131sm18326939pga.24.2017.09.26.14.07.31
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Tue, 26 Sep 2017 14:07:32 -0700 (PDT)
From: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-trivial@nongnu.org, eblake@redhat.com,
	=?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
Date: Tue, 26 Sep 2017 14:07:23 -0700
Message-Id: <20170926210723.38042-1-carenas@gmail.com>
X-Mailer: git-send-email 2.13.5 (Apple Git-94)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-trivial] [PATCH v2] gitignore: ignore check-qlit test
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
X-List-Received-Date: Tue, 26 Sep 2017 21:07:40 -0000

test introduced in 382176b4d78e070d119af8e0dcd00884c11bbec2

Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index cf6d99c91e..53cb2efaee 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -6,6 +6,7 @@ check-qdict
 check-qnum
 check-qjson
 check-qlist
+check-qlit
 check-qnull
 check-qstring
 check-qom-interface
-- 
2.13.5 (Apple Git-94)



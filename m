Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwwQR-0003Ex-BH
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 16:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwwQP-0003Dc-IG
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 16:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwwQO-0000g0-Pk
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 16:25:49 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <carenas@gmail.com>)
	id 1dwwQI-0000dS-Qd; Tue, 26 Sep 2017 16:25:42 -0400
Received: by mail-pf0-x244.google.com with SMTP id h4so5434824pfk.0;
	Tue, 26 Sep 2017 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fjIeKaQWQyL9+xgz2Xv1+hGQtMy5OYvNLnhWnkr4bgs=;
	b=Ed0UD+hapMv11bfJTH/1o8oimDQBPg1Y7dNIxu9X9ddcbIP04yvB1ym9OmVc+OYEdj
	Fq6hQ97J2e66GVv+xgFfM0WSSCbmcd5OWm3YWFYek6CMNq/88qd8VVNpEhGjMUX7YFuo
	4XovysKC7t6qCNuj/YHSv4J65eziiiPO+vuZB+FUvB3Q+rtHilKDkbH/ZfiIsFHd2pGa
	014M4G9Zl/0aM9J8RxRlOlWYlsZTu7n9YDuVFgqN8QAP+Y7tyUTZZ5rqSUUDChvazNZx
	iyt3unGZ/jUz6YYi1IMYmoW8p8lphMIyOuEDDJ74FOIZ4rwVmUmPiZOLl2FcWiDQTSzX
	mDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fjIeKaQWQyL9+xgz2Xv1+hGQtMy5OYvNLnhWnkr4bgs=;
	b=EfIdi+prF6cXVxClVhOhiadbX1ilUVUtBx8BpDwgypX7GaK0Mqd6BnJ81aQ+sMRrNf
	oMLe4wiWRgosDHqYH7k+X0tUPsOR0PuyeYlojfRl55E9bjI74EBopKn2rmot5FvNiEPq
	J3UOK8issZLZdVeGW+5bQ7gfO4vxD90z/soXW0/BEMW+ltBD5l3uS7H97k/R0PzTekQ8
	YxFf6JZXi4hvn+DxKHZaESXjWkA2IEaXOfqS9Mytzh02ATohKE9KdKjEYtXXhuv4Gfw9
	WGfM5LTOpD08V8L5QRItoA7B699KGHOleLQLS1YlYc9r/x3C/xG/Rw2sVJlSFdMEXLzp
	uvPw==
X-Gm-Message-State: AHPjjUjHRVV8DKutsYhtoabRUVqxu5na7NzMVxaVFn4KR9kRXBYWHpO4
	Y9nWzvEtDYCnrNnphO5DPZWPZKSO8xA=
X-Google-Smtp-Source: AOwi7QCBZCh6UVUaXB8owBIbVYAcv9MX+4zkmflL56LeHFznFljy0cL4aMAN2vG9jqkRH+ll32NdgQ==
X-Received: by 10.99.123.79 with SMTP id k15mr12143871pgn.33.1506457541382;
	Tue, 26 Sep 2017 13:25:41 -0700 (PDT)
Received: from 172-11-32-171.lightspeed.mmphtn.sbcglobal.net
	(50-207-95-178-static.hfc.comcastbusiness.net. [50.207.95.178])
	by smtp.gmail.com with ESMTPSA id
	k67sm16006895pga.46.2017.09.26.13.25.40
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Tue, 26 Sep 2017 13:25:40 -0700 (PDT)
From: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-trivial@nongnu.org,
	=?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
Date: Tue, 26 Sep 2017 13:25:12 -0700
Message-Id: <20170926202512.37670-1-carenas@gmail.com>
X-Mailer: git-send-email 2.13.5 (Apple Git-94)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-trivial] [PATCH] gitignore: ignore check-qlit test
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
X-List-Received-Date: Tue, 26 Sep 2017 20:25:50 -0000

Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
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



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPV-0000CT-4f
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPI-0008HY-CE
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0007d7-Bj
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:20 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:45783)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP9-0007SE-LP; Tue, 11 Dec 2018 13:05:12 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N14xe-1hTNaJ12ao-012UK7; Tue, 11 Dec 2018 19:04:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:46 +0100
Message-Id: <20181211180352.19644-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N3bKfa+8vxpSEXffbiVL/i7YRvlbYOXO1qyuNEJYby7A2XOL1FG
	tDj5m/P20hUatXYlq5LIjYLM9XZJYOcjGSxy58fvaPsMMi+PHV0eD2fZh8HwtQ2dysA6abZ
	3jwdSy1PEQSr680LiR5kvdS5znMC07yanrIgiZT10HEobg/lum1iOMXVpw0EE4U7YC5dAdI
	tziu0O1G7H4f7CHNUNx5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QRhw402blhE=:xrlZEQi8AM/NhI1lgYGIoi
	Ns/UcgvtMe7VpG6YZ7PXvIxfGMTAsFH7uj9vwZldxx9k/6u/0hMYFUE/MQ8aUhx5f8OPYfJHN
	RW9XW5dEGksROTMwMDmNDJY813T52NPG7WrpRfyVy4xyIpwyrsVE0tAyKT2RQJPKO11NMWBlu
	4xUbgUENN6izm6Yh4wNWKSITwebTiSorts87kBbr/wR+SW9LqkdM1DMJ+jJwHGEWfAI6fTeVc
	3bHbwyCkmkldTPTgGEBjCHy3KETdHokjDmcq7NUHWsxwSSmd2SKALK9foIpwG1y4l6GrjRV5p
	xgQQ0lnyYifTo06fNt5dzDHnkdXK6S2gL6dml4hvQOb6NPNd2uGBzMR5BvV9vRDvlfT4rIO3c
	f3GGSXLHqoM86mwF/Vzu1PWe2AKNVhWy1l9jouOz0IQfSdz/dcW7Uwft7rA8T6ItX8mU5J2nz
	4lP4kBRcH90SIKw8xaWLM6/kyt7YNI+Et3w4hpE7F9OlSi5ou9P3rSd1l1tNU0cLv2JH7E8bV
	MlgfhFkf6OTGwRVlKTK5/vdeGazwnnkjadHiNcDAhfJv2wl1TMP1zoFHraNIV/QbObsrXw3nF
	jOQ4jO35nSJbqfe1jo6hWNjUb3gWyNEFLHBXuo6XkE+QdX4xDTGQzXy5MXxFVgI/l/3fo7h2q
	QzWsomGOdsOJh2Ah3llq6bvC7d/dKnpr96h/HurwYPMySonw6lcdRrxPWJHqHas9gjeD2YEWW
	eTVgp1FkAYyCgDBIhSjoQViCof/RcYiorI8nyPy3LQ62P5IxQSuaDcKC0KM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 24/30] MAINTAINERS: Use my work email to
 review Build and test automation patches
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:26 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181125205000.10324-25-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 84e248c013..0e5c9cf52a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2406,7 +2406,7 @@ Build and test automation
 Build and test automation
 M: Alex Bennée <alex.bennee@linaro.org>
 M: Fam Zheng <famz@redhat.com>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 L: qemu-devel@nongnu.org
 S: Maintained
 F: .travis.yml
-- 
2.19.2



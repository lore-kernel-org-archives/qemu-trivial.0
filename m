Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihYx6-0001yP-LY
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 08:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihYx2-0001su-OL
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihYx1-0007lD-Hm
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:16 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:44313)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ihYx1-0007ez-4G; Wed, 18 Dec 2019 08:01:15 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MY5wD-1iC0HB4AEH-00YQSd; Wed, 18 Dec 2019 14:01:09 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 2/7] monitor: Remove unused define
Date: Wed, 18 Dec 2019 14:01:00 +0100
Message-Id: <20191218130105.125981-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191218130105.125981-1-laurent@vivier.eu>
References: <20191218130105.125981-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B6YPh6a/2Jn6QR7PRjH8XuSgK1AeJBsTvAMvlseB60rXwBbjtiq
 5SQP5rSegMUe7F31KDqjPqgFFwV4u7U9Tyy9zO8h9vI2zf3XLpK6TxogKmalpmEEA5riGGD
 wWZEzv/CSORnItLTf/D0OA32lMzT1iR0AXk2A2LFMJvmvOytyB2p+AscEM1StKlJdOH/06o
 MHAfD6oRP3cO4UuFe+QIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YTmUnv4x634=:k6CeyI2mP3DJzZbZeR2FS6
 56caXC+zSxoi8pIHEUlDP4ZLJafV8ECbqU+QSsa19+sRcmcprFNeyQrVY19dUElhMDgN29/y9
 +wGh4yhs/DlVRqnQ/LBa24kMSHRtWpiG8GRGTBNW0OmtAJmlQChdBrWgNLfvKI9Ks99T6v7At
 EySLab584XiKCrw2tzhbFf8jrOWQqDu3Pgb2xIP10H3NAni0Fnb1i+WzL6HF0c++RRk1wX9aV
 8mdnetrabIIrlJApznx/snTinlIPqMiNHoYE/fDb8hUlTMd8+PRkUOgnzr81feWlS9t2DaQ+9
 4ttxt4AXTI5h9xCrPTlJpI69UQAMZQOPVMvXw+sqweadJzHZXGqeEVeTpK8tqML1Q5awc6RxW
 iXp1F77vMvDzQy5FV90HrrCuasZ2ZBnlkC1XyUGZXU9KArsDARUzG5cftqAHuZLuelI53evLf
 3JAHJETooOQ1EEv5SvG8Lj/fi0y6jDz68BlDQFJExN35A5QS694bJ0uhIfHlFGz7AaSgTzdtK
 cZgROv5UAmaEINKpY/qV5oYRq1ZV0leeANh3ZWW2+96pEySAhDk/QVeL2u77f1ev/ZTRg396C
 KYdC5L8GRGy6dOlV4S9+AgGxAMmewpF8inDJEMj9ZCxg9O7NGWFft2J0lO0vQ0I6CYCS8LtRP
 4lDy8+Cpdu1XXDNUan/40cUoz1y8Yk8R+uPGlcJ34g1ypxZc6lTbM0M8TJnXGD3kVWCqZW2WP
 GXpeAv2ngjVC9KYxURchERGi3IJW3k17KkU0P3/Z8t0AqJL8/qfKAVGDWTMp8DVX44tSZJ4eK
 Xxu2hmNy1iKi10zdp7WKPzzbp4QM2BwyPmddEejfmK9xtcCExqxf3/O273pjPBSpK2Oh8MDzh
 BS7pu3ExuYWfnkSU85i5swb9foo/UXZKL8bGRICPg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 13:01:19 -0000

From: Yury Kotov <yury-kotov@yandex-team.ru>

Remove the definition of QMP_ACCEPT_UNKNOWNS as it is unused since
refactoring 5c678ee8d940

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191119110709.13827-1-yury-kotov@yandex-team.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 monitor/misc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 3baa15f3bfac..6680734ea150 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -106,9 +106,6 @@ struct MonFdset {
     QLIST_ENTRY(MonFdset) next;
 };
 
-/* QMP checker flags */
-#define QMP_ACCEPT_UNKNOWNS 1
-
 /* Protects mon_fdsets */
 static QemuMutex mon_fdsets_lock;
 static QLIST_HEAD(, MonFdset) mon_fdsets;
-- 
2.24.1



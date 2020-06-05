Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhFLx-00014L-RP
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jun 2020 12:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jhFLw-00012Y-HK
 for qemu-trivial@nongnu.org; Fri, 05 Jun 2020 12:37:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55497
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jhFLv-0007Rr-2X
 for qemu-trivial@nongnu.org; Fri, 05 Jun 2020 12:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591375073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=98qgKBh5fH8KCi85m1CSGYKJMMXRY6XnMEUwXUwkDZ0=;
 b=WEF2buCRaP8cEp0GLSzjkly7lgwaQxIzUUonLvqsQWeJ9PjPpNAgVYHiecFyV5TFMMja+X
 VFkwPlFvPC1cOb42f30iyQtVuUNiar7YHX93tgwbeN6i3aYpjiXf03MnoQlWvcaLfulfT/
 Ep+FH1Y+j73M6iFahy1sDRU215dycVE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-TcJPMRZMNlG_LxMxwUcIGA-1; Fri, 05 Jun 2020 12:37:51 -0400
X-MC-Unique: TcJPMRZMNlG_LxMxwUcIGA-1
Received: by mail-wm1-f72.google.com with SMTP id s15so3189339wmc.8
 for <qemu-trivial@nongnu.org>; Fri, 05 Jun 2020 09:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98qgKBh5fH8KCi85m1CSGYKJMMXRY6XnMEUwXUwkDZ0=;
 b=f8Szkl4GYaZ5MWbqPcUhcxVhK5sZFTsQ3KyZex+qNzCs4IJljqf0dEKfQUEmV0LqKT
 nwdz6r+tTNnkGyiJfFjPGmDJIE5NRy3LAndqXLxgi4iRXg0Q2dt2HaygN4/OelbW0+13
 xJs9CjJ63Ein4KpS7he0yK6MStcvplDFGxygg55Jhnvx45RBfcn5D5leBGACArbAO0P5
 mi0zSq7vrd3swXtMvuvvfAarqw4Ml+yAF3xY599eS1S/CcI8nQRU29DBHJj4ce/wyYR8
 /C6Sf9YVsGZ6NSS8NBU2bZujK81nDVV2ngpn+9s4iiVAoZO1wH8U+54pOQcgIIk9pwgS
 Wggw==
X-Gm-Message-State: AOAM5319SJFlENdsDrlGNoFQFc1h38rS5xHqVMVoOx7w7cUgoPcSd59T
 SuIT6Q3TcHhyycW9iqrAjtFK09eMRFen8EpOBJyrWha0rh/kZBgvy0MFRNW+Y/I81C5L4a3/HEu
 zrzpIhENEwJoruec1oA==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr10235516wrm.72.1591375070782; 
 Fri, 05 Jun 2020 09:37:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVt/qITuRNR0feGAJAg9/RgrY4AX3krhPw+YgNYv8ISRguIx4xpEJDEuK+i0Gv009+AUWqZw==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr10235496wrm.72.1591375070604; 
 Fri, 05 Jun 2020 09:37:50 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id s132sm12444779wmf.12.2020.06.05.09.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 09:37:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Cover pip requirements.txt
Date: Fri,  5 Jun 2020 18:37:48 +0200
Message-Id: <20200605163748.15345-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:35:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Fri, 05 Jun 2020 16:37:56 -0000

Add an entry in 'Python scripts' to cover the requirements.txt
file added in commit 213137217a6 (this file contains a list of
Python packages used by our test suite).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e7d9cb0a5..fc4148fba3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2219,6 +2219,7 @@ S: Odd fixes
 F: python/qemu/*py
 F: scripts/*.py
 F: tests/*.py
+F: tests/requirements.txt
 
 Benchmark util
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
-- 
2.21.3



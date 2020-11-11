Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcouc-000060-QL
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2020 07:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kcouZ-0008Uu-9w; Wed, 11 Nov 2020 07:07:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kcouW-00063s-A5; Wed, 11 Nov 2020 07:07:39 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWNl30wbRzLxNW;
 Wed, 11 Nov 2020 20:07:11 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 20:07:15 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <armbru@redhat.com>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: [PATCH] json: Fix a memleak in parse_pair()
Date: Wed, 11 Nov 2020 11:56:09 +0000
Message-ID: <20201111115609.48888-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:07:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Nov 2020 12:07:41 -0000

In qobject_type(), NULL is returned when the 'QObject' returned from parse_value() is not of QString type,
and this 'QObject' memory will leaked.
So we need to first check whether the 'QObject' returned from parse_value() is of QString type,
and if not, we free 'QObject' memory and return an error.

The memleak stack is as follows:
Direct leak of 32 byte(s) in 1 object(s) allocated from:
    #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
    #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
    #2 0xaaab3557d9f7 in qnum_from_int /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
    #3 0xaaab35584d23 in parse_literal /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
    #4 0xaaab35584d23 in parse_value /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
    #5 0xaaab35583d77 in parse_pair /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
    #6 0xaaab355845db in parse_object /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
    #7 0xaaab355845db in parse_value /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
    #8 0xaaab35585b1b in json_parser_parse /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
    #9 0xaaab35583703 in json_message_process_token /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
    #10 0xaaab355ddccf in json_lexer_feed_char /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
    #11 0xaaab355de0eb in json_lexer_feed /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
    #12 0xaaab354aff67 in tcp_chr_read /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
    #13 0xfffe4ae429db in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x529db)
    #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
    #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
    #16 0xaaab34d70bff in iothread_run /Images/source_org/qemu_master/qemu/iothread.c:82
    #17 0xaaab3559d71b in qemu_thread_start /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519

Fixes: 532fb5328473 ("qapi: Make more of qobject_to()")
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 qobject/json-parser.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index d083810d37..b37762a203 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -267,10 +267,13 @@ static int parse_pair(JSONParserContext *ctxt, QDict *dict)
         goto out;
     }
 
-    key = qobject_to(QString, parse_value(ctxt));
-    if (!key) {
-        parse_error(ctxt, peek, "key is not a string in object");
+    value = parse_value(ctxt);
+    if (!value || qobject_type(value) != QTYPE_QSTRING) {
+        qobject_unref(value);
+        parse_error(ctxt, peek, "value is not a string in object");
         goto out;
+    } else {
+        key = qobject_to(QString, value);
     }
 
     token = parser_context_pop_token(ctxt);
-- 
2.19.1



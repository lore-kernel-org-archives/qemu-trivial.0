Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJN9I-0007Uc-Pe
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 09:39:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmj-0002WR-6X
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmc-0001Z5-QU
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:17 -0400
Received: from [59.151.112.132] (port=32573 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XJGmO-0001Me-L3; Mon, 18 Aug 2014 02:50:56 -0400
X-IronPort-AV: E=Sophos;i="5.04,348,1406563200"; d="scan'208";a="34726258"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2014 14:48:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7I6ooVx031638;
	Mon, 18 Aug 2014 14:50:50 +0800
Received: from G08FNSTD131468.fnst.cn.fujitsu.com (10.167.226.78) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 18 Aug 2014 14:50:55 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Date: Mon, 18 Aug 2014 14:46:32 +0800
Message-ID: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.78]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 18 Aug 2014 09:38:58 -0400
Subject: [Qemu-trivial] [RESEND v2 0/3] Fix some memory leaks about query
	memdev
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Aug 2014 06:51:23 -0000

when using valgrind to test the command "query memdev", I had
found some memory leaks. the test result:

==13802== 4 bytes in 1 blocks are definitely lost in loss record 125 of 8,508
==13802==    at 0x4A08934: malloc (vg_replace_malloc.c:291)
==13802==    by 0x4A08AA8: realloc (vg_replace_malloc.c:687)
==13802==    by 0x64C5736: g_realloc (in /usr/lib64/libglib-2.0.so.0.3400.2)
==13802==    by 0x64DE226: ??? (in /usr/lib64/libglib-2.0.so.0.3400.2)
==13802==    by 0x64DE279: g_string_sized_new (in /usr/lib64/libglib-2.0.so.0.3400.2)
==13802==    by 0x47CFBB: string_output_visitor_new (string-output-visitor.c:341)
==13802==    by 0x3F456F: object_property_get_uint16List (object.c:970)
==13802==    by 0x1E8764: query_memdev (numa.c:361)
==13802==    by 0x3F3248: object_child_foreach (object.c:686)
==13802==    by 0x1E9141: qmp_query_memdev (numa.c:389)
==13802==    by 0x2D79A0: qmp_marshal_input_query_memdev (qmp-marshal.c:5057)
==13802==    by 0x1DD7D7: handle_qmp_command (monitor.c:5038)

==15046== 48 (16 direct, 32 indirect) bytes in 1 blocks are definitely lost in loss record 4,722 of 8,549
==15046==    at 0x4A08934: malloc (vg_replace_malloc.c:291)
==15046==    by 0x64C541D: ??? (in /usr/lib64/libglib-2.0.so.0.3400.2)
==15046==    by 0x64C56E6: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.3400.2)
==15046==    by 0x1E868C: query_memdev (numa.c:325)
==15046==    by 0x3F3258: object_child_foreach (object.c:686)
==15046==    by 0x1E9141: qmp_query_memdev (numa.c:389)
==15046==    by 0x2DDFF3: hmp_info_memdev (hmp.c:1687)
==15046==    by 0x1E4B08: handle_user_command (monitor.c:4119)
==15046==    by 0x1E4E7A: monitor_command_cb (monitor.c:5156)
==15046==    by 0x496056: readline_handle_byte (readline.c:391)
==15046==    by 0x1E4BCE: monitor_read (monitor.c:5139)
==15046==    by 0x2BCDEF: fd_chr_read (qemu-char.c:213)


Chen Fan (3):
  query-memdev: fix potential memory leaks
  qom/object.c: fix string_output_get_string() memory leak
  hmp: fix MemdevList memory leak

 hmp.c        |  8 ++++++--
 numa.c       | 15 +++++++--------
 qom/object.c | 12 ++++++++++--
 3 files changed, 23 insertions(+), 12 deletions(-)

-- 
1.9.3



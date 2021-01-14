Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzxyI-0004Hf-RV
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2021 03:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyI-0004Fn-12; Thu, 14 Jan 2021 03:27:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyF-0006a0-Kv; Thu, 14 Jan 2021 03:27:09 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DGcpF6QF0z15sh9;
 Thu, 14 Jan 2021 16:25:57 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Thu, 14 Jan 2021
 16:26:53 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
CC: <alex.chen@huawei.com>, <hunongda@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <zhanghan64@huawei.com>
Subject: [PATCH 0/6] Fix some style problems in audio
Date: Thu, 14 Jan 2021 16:10:53 +0800
Message-ID: <20210114081059.19632-1-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhanghan64@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 14 Jan 2021 08:27:10 -0000

Some style problems in audio directory are found by checkpatch.pl. Fix these
style problems.

Zhang Han (6):
  audio: Add braces for statements/fix braces' position
  audio: Add spaces around operator/delete redundant spaces
  audio: foo* bar" should be "foo *bar".
  audio: Fix lines over 90 characters
  audio: Don't use '#' flag of printf format ('%#') in format strings
  audio: Suspect code indent for conditional statements

 audio/alsaaudio.c      | 15 +++++--------
 audio/audio.c          | 26 ++++++++++------------
 audio/audio_template.h | 14 +++++-------
 audio/coreaudio.c      | 17 +++++++-------
 audio/dsoundaudio.c    | 50 +++++++++++++++++++++++++++---------------
 audio/jackaudio.c      |  2 +-
 audio/ossaudio.c       | 12 ++++------
 audio/paaudio.c        |  2 +-
 8 files changed, 68 insertions(+), 70 deletions(-)

-- 
2.29.1.59.gf9b6481aed



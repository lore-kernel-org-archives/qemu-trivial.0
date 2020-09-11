Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGooA-0003MO-HT
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 15:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kGoo7-0003DU-1k; Fri, 11 Sep 2020 15:34:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kGoo5-0000rV-7x; Fri, 11 Sep 2020 15:34:02 -0400
Received: from localhost.localdomain ([82.252.129.222]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsrV2-1kW1Ku3qw4-00tBCE; Fri, 11 Sep 2020 21:33:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 13/18] test-vmstate: remove unnecessary code in
 match_interval_mapping_node
Date: Fri, 11 Sep 2020 21:33:25 +0200
Message-Id: <20200911193330.1148942-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200911193330.1148942-1-laurent@vivier.eu>
References: <20200911193330.1148942-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zUMa+ifWKXfiliAtzAp9S1WzSxOX2l29IOjWwDZNHPGOvNxcfCZ
 8Jl5Fk8z/3yV29GER/jQXVhnnjeW9Sb3kvGraeO2BPB8D9ccWIb11vYlfVITITAZUNMgzc0
 nQzSEC+Hge922iJdo6YLhFtA4MReHB3LsdnDTbyeaGp+DiCczT1RW0ikUZ/+8/9kfouzKmO
 qJAWebWzTd8ik6jQvWNkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SsnXC+ZFTxo=:d7qKma8lvLuGRwj2S5pPwc
 7ZjtJnJTxb8kuDmPR3iejYhxcVBlbgauN6PkcXyFcROd8m8L711AxahwFeARogGYTxFnDemnI
 ZwKLSmaTildwg8up22ofW3jIeDjfljl1zKQ/9Eiw/L2T0+Ab/1qvoM62R9Nj3JXMxtCn8uAXC
 P04TLo3QnGgu/Vz0Cy+E0a94IfX3TOReg3iJik0Jr1Z32vosARJrK9Niyu5QYWvNKzpI6YtCb
 B5GxK5vx57a5a3uTG+WUOcJ+xXHAvvDlfWG+rFNcRimnIyl+dr0Nem35MsOF5mX92az+XszWi
 JpoTYbhCnwR1A3K8CD87OWi9Ptc3MLw9Creq4C0lMp2i7YwknSU0slya4B/H50VjBf2LpUrio
 faFBfww3NMMH/mjj/s/tV7OOPaXmPORyQxfKepmFMCJv8CtM+Kw6SkkkjqxVOQfrwvtsWGn3n
 s2MK/S0iSyO89pgyF/ne91l/WhS+vKZiC4pE/jo0QBUECfvImQeTCsdBtK90hDlfrg10Ngt82
 L/H7ejZv5XBvgI3T0YYcdkK1Fkkabfw6cL4cC+j9PM5cWuQSaRFVim1iXM/4HirCqGB3JQlX1
 tGj7kZ1XvQ/ChZFVMUQp69BMbJavLzEHtDLPo6+lm03qyTrh6atTBz+/CHMpVicqR/LxuvZX9
 e1I4mXV7DN8AMEzEou7SS6Ftq6JYDN2gTj5mJtiEfEOCViOxyWGnYQQNJBvofdejoBDdH99Cj
 0L9zCT13YqBiMptDnmuAbsQv7qTKMp0zF907Wuwt61FuUuA11KFl0u7DY2VkcJby1Q+ozQkaT
 QYBE5GhJUHcYdTRx1OJmGDE6D19+mMdjrs9xjCiXYPEc9JFXoYq99oIylFwgxo+wTshsFqs
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 15:33:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Sep 2020 19:34:03 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

'str' is not used in match_interval_mapping_node(), remove it.

Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200910023818.11880-1-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/test-vmstate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index f8de709a0b2b..1c763015d03c 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -1055,9 +1055,6 @@ static gboolean match_interval_mapping_node(gpointer key,
     TestGTreeMapping *map_a, *map_b;
     TestGTreeInterval *a, *b;
     struct match_node_data *d = (struct match_node_data *)data;
-    char *str = g_strdup_printf("dest");
-
-    g_free(str);
     a = (TestGTreeInterval *)key;
     b = (TestGTreeInterval *)d->key;
 
-- 
2.26.2



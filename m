Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMZBp-0001uT-H7
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2023 13:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pMYMI-0003mb-2n
 for qemu-trivial@nongnu.org; Mon, 30 Jan 2023 12:54:32 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pMYMF-0005Hv-VS
 for qemu-trivial@nongnu.org; Mon, 30 Jan 2023 12:54:21 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8700711EE5E;
 Mon, 30 Jan 2023 17:54:15 +0000 (UTC)
From: ~vlaomao <vlaomao@git.sr.ht>
Date: Mon, 30 Jan 2023 17:54:15 +0000
Subject: [PATCH qemu 0/1] MAC address falls to permanent
MIME-Version: 1.0
Message-ID: <167510125533.6740.18222174398575558338-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~vlaomao <vlaomao@gmail.com>
To: laurent@vivier.eu
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Jan 2023 13:47:35 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2023 17:54:38 -0000

A bug was found with the vmxnet3 driver, after changing the MAC address
and rebooting, it falls into the category of a permanent address until
the VM is turned off. Here is log output:

-bash-4.4# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff

-bash-4.4# ip link set dev ens3 address 33:33:33:33:33:33
-bash-4.4# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 33:33:33:33:33:33 brd ff:ff:ff:ff:ff:ff
-bash-4.4# ethtool -P ens3
Permanent address: 52:54:00:12:34:56
-bash-4.4# reboot

//rebooting


-bash-4.4# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 33:33:33:33:33:33 brd ff:ff:ff:ff:ff:ff
-bash-4.4# ethtool -P ens3
Permanent address: 33:33:33:33:33:33
-bash-4.4#

VlaoMao (1):
  vmxnet3: add mac address restore upon reset

 hw/net/vmxnet3.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.5


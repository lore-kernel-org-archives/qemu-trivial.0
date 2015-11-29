Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zPH-00007R-8w
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:40:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zPF-00005Q-3u
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:40:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zPE-0008Rx-6M
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:40:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zP8-0008QC-2V; Sun, 29 Nov 2015 05:40:26 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 75E2543237;
	Sun, 29 Nov 2015 13:40:25 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5E03DA68;
	Sun, 29 Nov 2015 13:40:25 +0300 (MSK)
Message-ID: <565AD619.70103@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:40:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1448647022-8379-1-git-send-email-pbonzini@redhat.com>
	<5659C4B5.8030108@redhat.com>
In-Reply-To: <5659C4B5.8030108@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] bt: check struct sizes
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
X-List-Received-Date: Sun, 29 Nov 2015 10:40:34 -0000

28.11.2015 18:13, Paolo Bonzini wrote:
> On 27/11/2015 18:57, Paolo Bonzini wrote:
>> See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
>> reasons these do not use sizeof, and Coverity caught a mistake in
>> EVT_ENCRYPT_CHANGE_SIZE.
>>
>> Note other sizes that seem wrong or inconsistent with the kernel header.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Hmm, can do better...

Can do, or will do, or?
Note we've lost last S-o-b (by Markus) as well ;)

/mjt


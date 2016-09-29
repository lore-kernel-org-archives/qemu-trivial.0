Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdcg-0006md-TR
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 11:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdce-0006jl-Lu
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdcc-0002CS-T5
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:51:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpdcX-00027x-22; Thu, 29 Sep 2016 11:51:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D878C43207;
	Thu, 29 Sep 2016 18:51:31 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id B5988B0F;
	Thu, 29 Sep 2016 18:51:30 +0300 (MSK)
To: Fam Zheng <famz@redhat.com>, Lin Ma <lma@suse.com>
References: <20160923091606.20323-1-lma@suse.com> <20160923093637.GI8832@lemon>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <4fb13476-536a-bf15-72e2-ba701339f10c@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 18:51:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160923093637.GI8832@lemon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] maint: Add module_block.h to .gitignore
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
X-List-Received-Date: Thu, 29 Sep 2016 15:51:45 -0000

23.09.2016 12:36, Fam Zheng wrote:
> On Fri, 09/23 17:16, Lin Ma wrote:
>> Commit 0c0c1fd9 generated module_block.h automatically, Add it to .gitignore to
>> avoid checking in it by 'git add .'.

Applied to -trivial, thank you!

/mjt


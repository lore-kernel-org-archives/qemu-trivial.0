Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08D0-0006fJ-SP
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 10:32:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08Cw-0006bI-3B
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:32:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08Cs-00024a-DP
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:32:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08Cm-0001wu-79; Fri, 28 Oct 2016 10:32:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 712C943714;
	Fri, 28 Oct 2016 17:32:21 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5CE84B49;
	Fri, 28 Oct 2016 17:32:20 +0300 (MSK)
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
References: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, eblake@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d53da4ff-65f1-db59-4bd3-e4682fc8c44c@msgid.tls.msk.ru>
Date: Fri, 28 Oct 2016 17:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v4 0/2] Script changes to find duplicate
 #include entries
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
X-List-Received-Date: Fri, 28 Oct 2016 14:32:38 -0000

21.10.2016 09:57, Anand J wrote:
> There were some files in the code base with multiple inclusion of the same header files.
> Following changes are made to mitigate this issue.
> 
>  1) --check-dup-head option is added to the scripts/clean-includes to search files and
>     find out such entries. This will help to catch redundant #includes in the future.
>  2) Removed most of the duplicate entries currently present in the code base using the
>     script.
> 
> Anand J (2):
>   scripts/clean-includes: added duplicate #include check
>   clean-up: removed duplicate #includes

Applied both to -trivial, thank you!

/mjt


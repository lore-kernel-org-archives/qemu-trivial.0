Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYVmX-0000ra-Pt
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 04:26:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVmV-0000ng-Gt
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVmR-0000Su-Om
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:26:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYVmN-0000SL-Ih; Thu, 19 Mar 2015 04:26:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A487741E29;
	Thu, 19 Mar 2015 11:26:10 +0300 (MSK)
Message-ID: <550A8822.3030607@msgid.tls.msk.ru>
Date: Thu, 19 Mar 2015 11:26:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1426410988-3695-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1426410988-3695-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, armbru@redhat.com,
	zhaoshenglong@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v3] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Thu, 19 Mar 2015 08:26:20 -0000

15.03.2015 12:16, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> 	v1->v2: line length [Fam], pass &error_abort [Shannon]
>         v2->v3: use "!!" instead of "? true : false" [Markus]

And ofcourse after finding v2 and v3, I applied this v3 one instead of
the initial version with a fixup.  Well, this boolean thing becomes
really ugly... :(

Thanks,

/mjt


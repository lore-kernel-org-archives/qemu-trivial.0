Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anQth-0007U4-9h
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 09:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1anLJB-0007TV-Kl
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 03:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1anLJA-0008Cr-Nz
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 03:21:53 -0400
Received: from [59.151.112.132] (port=58804 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1anLJ4-00081B-Lg; Tue, 05 Apr 2016 03:21:47 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5273393"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Apr 2016 15:21:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 38CA842B55E5;
	Tue,  5 Apr 2016 15:21:34 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Tue, 5 Apr 2016 15:21:33 +0800
Message-ID: <57036822.9070501@cn.fujitsu.com>
Date: Tue, 5 Apr 2016 15:24:18 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: qemu devel <qemu-devel@nongnu.org>, qemu trivial
	<qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee
	<alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, John Snow <jsnow@redhat.com>
References: <1459838127-32288-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
In-Reply-To: <1459838127-32288-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 38CA842B55E5.AAA42
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 05 Apr 2016 09:19:56 -0400
Cc: Wen Congyang <wency@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [PATCH] tests: ignore test-logging
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
X-List-Received-Date: Tue, 05 Apr 2016 07:21:54 -0000

On 04/05/2016 02:35 PM, Changlong Xie wrote:
> Commit 3514552e added a new test, but did not mark it for
> exclusion in .gitignore.
>
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>   tests/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/.gitignore b/tests/.gitignore
> index b7bf13e..898a35f 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -70,5 +70,6 @@ test-xbzrle
>   test-netfilter
>   test-filter-mirror
>   test-filter-redirector
> +test-logging
>   *-test
>   qapi-schema/*.test.*
>
It seems we should keep items in order, so

 From a6d9e3aeaee66941613ebed312ee7a1b0e80bcc3 Mon Sep 17 00:00:00 2001
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Thu, 31 Mar 2016 13:52:35 +0800
Subject: [PATCH] tests: ignore test-logging

Commit 3514552e added a new test, but did not mark it for
exclusion in .gitignore.

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
  tests/.gitignore | 1 +
  1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 6479b79..a303aaa 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -39,6 +39,7 @@ test-io-channel-file.txt
  test-io-channel-socket
  test-io-channel-tls
  test-io-task
+test-logging
  test-mul64
  test-opts-visitor
  test-qapi-event.[ch]
-- 
1.9.3




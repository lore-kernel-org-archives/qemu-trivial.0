Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WR3nm-0005By-IS
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 14:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WR3nj-00057U-Gc
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 14:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WR3ni-00082G-Pn
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 14:04:15 -0400
Received: from mel.v6.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:40164
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WR3ne-00081l-Tl; Fri, 21 Mar 2014 14:04:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id B520A27088F9;
	Fri, 21 Mar 2014 19:04:09 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcHtX8VyhJQL; Fri, 21 Mar 2014 19:04:09 +0100 (CET)
Received: from [10.10.1.115] (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id E8D3C27087C9;
	Fri, 21 Mar 2014 19:04:08 +0100 (CET)
Message-ID: <532C7F18.1010507@adacore.com>
Date: Fri, 21 Mar 2014 19:04:08 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] CODING_STYLE: Section
	about mixed declarations
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
X-List-Received-Date: Fri, 21 Mar 2014 18:04:16 -0000

On 03/17/2014 07:26 PM, Eduardo Habkost wrote:
> We had an unwritten rule about declarations having to be at beginning of
> blocks. Make it a written rule.
> 

Hello Eduardo,

Is it possible to check this rule in script/checkpatch.pl? (or is it already?)

Regards,


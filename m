Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYtAf-0004yx-BK
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 05:57:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZYtAd-0004vQ-IW
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:57:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZYtAc-0008Ji-PN
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:57:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZYtAY-0008IP-Gb; Mon, 07 Sep 2015 05:56:58 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 2A751461C0;
	Mon,  7 Sep 2015 09:56:58 +0000 (UTC)
Received: from [10.36.112.56] (ovpn-112-56.ams2.redhat.com [10.36.112.56])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t879urpj025083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Sep 2015 05:56:56 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1441612292-14845-1-git-send-email-pbonzini@redhat.com>
	<CAFEAcA921SoB9wj79tm7OLrFfV_sZLy90NYOuePSdQ60GttJ5g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55ED5F65.3060809@redhat.com>
Date: Mon, 7 Sep 2015 11:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA921SoB9wj79tm7OLrFfV_sZLy90NYOuePSdQ60GttJ5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] add macro file for
	coccinelle
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
X-List-Received-Date: Mon, 07 Sep 2015 09:57:04 -0000



On 07/09/2015 11:22, Peter Maydell wrote:
> On 7 September 2015 at 08:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Coccinelle chokes on some idioms from compiler.h and queue.h.
>> Extract those in a macro file, to be used with "--macro-file
>> scripts/cocci-macro-file.h".
> 
> Can we put the "how to use this" instructions in the file
> itself as well as in the commit message, please?

Like this?

/* Coccinelle only does limited parsing of headers, and chokes on some idioms
 * defined in compiler.h and queue.h.  Macros that Coccinelle must know about 
 * in order to parse .c files must be in a separate macro file---which is
 * exactly what you're staring at now.
 *
 * To use this file, add the "--macro-file scripts/cocci-macro-file.h" to the
 * Coccinelle command line.
 */

Paolo


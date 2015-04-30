Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynuqe-0002BS-Q7
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 16:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynuqc-00029j-LN
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 16:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynuqb-0004uv-LG
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 16:14:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnuqW-0004tV-S7; Thu, 30 Apr 2015 16:14:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 664ED420FD;
	Thu, 30 Apr 2015 23:14:06 +0300 (MSK)
Message-ID: <55428D0E.8070706@msgid.tls.msk.ru>
Date: Thu, 30 Apr 2015 23:14:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
	<1430421390-2787-1-git-send-email-cota@braap.org>
In-Reply-To: <1430421390-2787-1-git-send-email-cota@braap.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] i440fx-test: guard ARRAY_SIZE definition
	with #ifndef
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
X-List-Received-Date: Thu, 30 Apr 2015 20:14:15 -0000

30.04.2015 22:16, Emilio G. Cota wrote:
> ARRAY_SIZE is defined in osdep.h so having an unconditional
> definition here is fragile.

Fragile in what sense?  Nothing in that file includes osdep.h.
At the maximum, compiler will issue a warning about redefinition
(it should really be redefinition, not the same definition),
which might be treated as error, and we'll just fix that
warning.. I'd say just be done with this, it doesn't deserve
that much attention ;)

Somehow initially I thought this patch actually FIXES a warning
of this sort.  But it looks lile it is only fixes a potential
warning. Oh well...  :)

Thanks,

/mjt


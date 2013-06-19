Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpE9y-0006fN-Md
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:54:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UpE9w-0006bL-6A
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:54:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UpE9t-0005hn-Up
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:54:32 -0400
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230]:45572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UpE9t-0005hG-MC
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:54:29 -0400
Received: by mail-la0-f48.google.com with SMTP id lx15so4313547lab.21
	for <qemu-trivial@nongnu.org>; Wed, 19 Jun 2013 01:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/6eJMMfzm0bTHe4L8L7EdqVB/prl/YEA2pP0Iz7h0Lo=;
	b=We55mi067WaCjYtwo+pPnIUmiQkzQFlkK9vTZW9wOp2ArF90ukD4leJNIEATn4K1y+
	BGxWVvcMO0a1sS2s3Ue9DdYFKV91uPs8eV+nREsDNfYRsDO0T5yMl1uyEfCIkoQ9jBiy
	mJn83bP0p85+i40rTcXhCTN45PO/teRraep6YmMQVXfzvVc/CxAo+WKqPsT6z09Ru9ZC
	0qhMDaBODfnPB7iWeYL6ZVGWwAFbXeydzOJAovuAy3Gkhk4nPnSzubUU+rfSvoHwsKRk
	75EyfoT6rbPjcM5j60aqTVzaANveuUOzax9gLaBxPEKOt+RS3J5R18X8WqlZSkTrXICl
	nYRQ==
X-Received: by 10.152.115.242 with SMTP id jr18mr888282lab.7.1371632067600;
	Wed, 19 Jun 2013 01:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Wed, 19 Jun 2013 01:54:07 -0700 (PDT)
In-Reply-To: <f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
	<f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jun 2013 09:54:07 +0100
Message-ID: <CAFEAcA_nmiybuL53TK3n8JUCeZQmg_P=g82Qh0thKg-aSm7q4Q@mail.gmail.com>
To: peter.crosthwaite@xilinx.com
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnU9u8QM+1m29EuH7/CYMGN02JBgxcvEcN30caMjbg+0ajHyDeY9+rAPQ0Mqzw6+46+RjPo
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::230
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 1/5] block/nand: Factor out common code
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
X-List-Received-Date: Wed, 19 Jun 2013 08:54:34 -0000

On 18 June 2013 12:08,  <peter.crosthwaite@xilinx.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Most of this computation of s->iolen is the same for both the if and
> else paths here. Factor out the common parts outside the if.
>
> Cc: qemu-trivial@nongnu.org

Please don't cc qemu-trivial on half a patchset: it makes
it awkward to commit to a submaintainer tree if half of
it has already gone somewhere else.

thanks
-- PMM


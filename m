Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQi3R-00053X-5h
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 18:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dQi3P-00052M-63
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 18:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dQi3O-0001EJ-DU
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 18:36:51 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60267)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1dQi3M-0001Bk-HI; Thu, 29 Jun 2017 18:36:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 27A9620AC0;
	Thu, 29 Jun 2017 18:36:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Thu, 29 Jun 2017 18:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=XyXLMXNFIWBpL92
	7afd3m06HYg6FsFMHwZPzpExD9uo=; b=ecg2/Q78qbGAvgYp5/iULn4YwJs36aD
	r2aKVI3TjonnUiOcy6omMl8wY627tYV+NArHj2WWbAmdkG3kLUnvRBdB+ADa/Hs/
	r2r7sL+6UUFmgeYoeKBCTe1Uzabv1Da9kFN/XFTA4xiKnby3rp3vBZuBM6GVZqJz
	3XoDtq+wGLcc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=XyXLMXNFIWBpL927afd3m06HYg6FsFMHwZPzpExD9uo=; b=eJauLpGQ
	6YrLQ3pmqq3g6Toqrzsy4AoShvakTi8/HJsIfeNGE0E/aJ8E6wmf5LWytopKt/gB
	0Z5QupDiW/J7WDFYNGAM0RrdyYthoust6k8+JXlNexvZi5YFFmHyjwrXZIDRUpTE
	W/nRT8DGgQT5mK0B7dZf//V99ANBjUfeHO7iv1GRBRJv4rGtLTpx/FWo3ryV7NQS
	FK5wFNsYSi15bqi2WPJWaOgVjt6DezM8PRjKux+WfI8IP6z9r5LgSq3klQgVq243
	VtwnnRzYgMDAdxia+GB/+DHpeLL1g2NoaWsPeO9pTF7dK6aK1YhwzSJQMNn44Emn
	vKkwlAP50S0utA==
X-ME-Sender: <xms:AIFVWUoFlK9HSOReSZhL_ndl3AIspPznZVQGA0gY-Anpb_WHOyULpQ>
X-Sasl-enc: 0TXgoNTXSfUXfUAlmt6OHC54gFaQnR59YcqiQ/7dErod 1498775807
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id D637A24232;
	Thu, 29 Jun 2017 18:36:47 -0400 (EDT)
Date: Thu, 29 Jun 2017 18:36:47 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	"open list:Trivial patches" <qemu-trivial@nongnu.org>
Message-ID: <20170629223647.GE9797@flamenco>
References: <149873841036.9180.16600465902334229930.stgit@frigg.lan>
	<149874010452.9180.5182724462159161565.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149874010452.9180.5182724462159161565.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-trivial] [PATCH v10 7/7] trace: [trivial] Statically
 enable all guest events
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
X-List-Received-Date: Thu, 29 Jun 2017 22:36:52 -0000

On Thu, Jun 29, 2017 at 15:41:44 +0300, Lluís Vilanova wrote:
> The existing optimizations makes it feasible to have them available on all
> builds.
(snip)
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
>  trace-events |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.


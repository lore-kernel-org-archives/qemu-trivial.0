Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDtRD-00072n-3y
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 04:18:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtR5-0006sK-UW
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:18:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtR1-00065I-Dq
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:17:55 -0500
Received: from mail-wg0-f46.google.com ([74.125.82.46]:41866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UDtQr-00062x-UR; Fri, 08 Mar 2013 04:17:42 -0500
Received: by mail-wg0-f46.google.com with SMTP id fg15so2184991wgb.25
	for <multiple recipients>; Fri, 08 Mar 2013 01:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ji+9en+xoeFS+UHibEF7AEsENssclnA0wtxJEYoacTI=;
	b=04AKLme1KxpTvzvJ9OvJLYC+ETDbnE6JWYNRHE++RUjthRaAVxBdqYtq+T0YvbFsWK
	2/CMpmmKEerWAlHvaSBc4QmyTPCBA60IyRkmtUj3h7mdin1fi39nYytgV7wkqzx86XY0
	yQuACFMPwaFQGmCcWiNYJAmTFqFbzZHWdMcj3rdhmngsC4tXhaRTatwJv+uYPwoXva3l
	O6k7soZE4Dak0Fllhzu4SBjMYAGzB/JSkoYlUeTE/JTXeFEnAEpb+0LAoRswEVZ4OjBc
	HiXYCBRekWy611VoKhVbp/v+G71EybwsMWHQP4I6uopJGt8WcGMCj72kBPTDv6jOMZeC
	vSHA==
X-Received: by 10.194.21.233 with SMTP id y9mr2289487wje.47.1362734261036;
	Fri, 08 Mar 2013 01:17:41 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:195:852b:b477:8102:5356])
	by mx.google.com with ESMTPS id ex1sm8157741wib.7.2013.03.08.01.17.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 01:17:40 -0800 (PST)
Date: Fri, 8 Mar 2013 10:17:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cole Robinson <crobinso@redhat.com>
Message-ID: <20130308091738.GB9597@stefanha-thinkpad.redhat.com>
References: <4cef3fca4cde08008905c89cc2b73069e67824bc.1361925092.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cef3fca4cde08008905c89cc2b73069e67824bc.1361925092.git.crobinso@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.46
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] rtc-test: Fix test failures with recent
 glib
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
X-List-Received-Date: Fri, 08 Mar 2013 09:18:02 -0000

On Tue, Feb 26, 2013 at 07:31:32PM -0500, Cole Robinson wrote:
> As of glib 2.35.4, glib changed its logic for ordering test cases:
> 
> https://bugzilla.gnome.org/show_bug.cgi?id=694487
> 
> This was causing failures in rtc-test. Group the reordered test
> cases into their own suite, which maintains the original ordering.
> 
> CC: qemu-stable@nongnu.org
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  tests/rtc-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

It's best to make test cases independent of order (no side-effects), but
this small patch fixes the problem.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSn7q-0000uA-Ee
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 13:30:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSn7o-0000tH-RO
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 13:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSn7i-0007IE-Tu
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 13:30:32 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fSn7i-0007HK-Lk
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 13:30:26 -0400
Received: by mail-pf0-x242.google.com with SMTP id b74-v6so12471338pfl.5
	for <qemu-trivial@nongnu.org>; Tue, 12 Jun 2018 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RO0b3xPcqe4fka0vshOhDFOYR9jiHh4ACBDsephfQhI=;
	b=BoBtSnwCsJXTV+mZRQSNKLM3HyGBOsMjQ2HmMMOj5i9Qmol+omfrOcolULzpv2q5EC
	hD9mGOOOfF+E10aywnIy0S72PtKX9cY5h9PZMouMtVkx9EvmTmqRZJuPbC1I5xnQVx/q
	kzqKZpyTpaBxY0hjWbngHr6Skcju627KhfHtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RO0b3xPcqe4fka0vshOhDFOYR9jiHh4ACBDsephfQhI=;
	b=l9QfeGdEO8dWYmas0kUK7YNn0ZWBKPr507fSD0n9Yyq2RCXnyXMJRpmyW2caTPR5CW
	Y5R6DsOxBVwTOQKxeBxcvwp9DnkjpoXOVXzVIvfWXqjJujD/AfWLi5CBN8mYHhelQtzZ
	tZtKPXL5jX4ELtZAlnhbWKMQWhkK5DScIyW8rlvEB6MdQv0v1/pUuze4tuEGIyGNukB0
	ntxbLiLfC0ihU9RtW8Xoc2q0zkVeNCfGEp0wywtf7SpjRVT3QI0XOJMekKYc4bZLqJ+s
	lM/qaXhxRPqOJEkvbjfgH16mJTqL80qHDFeLH6LMgNYU2LG+cyBrZyfTMw/560hW8w+Q
	hP2w==
X-Gm-Message-State: APt69E3BL90RWd7ELVB1zaf9SVkP+i5Fpbvtp2ymtuoRI9ZG6arRBVko
	g1Tl87FNGc2Q3JxBzit71kNQjw==
X-Google-Smtp-Source: ADUXVKI/1qxBbtXbrS+iVTyX0Mp+E+tPEQD4yWPhC2SszYH9VvRh8bTH21gschrBBbdacweEhKx9bA==
X-Received: by 2002:a63:7f51:: with SMTP id
	p17-v6mr1147372pgn.36.1528824625443; 
	Tue, 12 Jun 2018 10:30:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	f16-v6sm1119090pff.57.2018.06.12.10.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 10:30:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
	patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
Date: Tue, 12 Jun 2018 07:30:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611141716.3813-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Tue, 12 Jun 2018 17:30:33 -0000

On 06/11/2018 04:17 AM, Peter Maydell wrote:
> The codebase has a bit of a mix of different multiline
> comment styles. State a preference for the Linux kernel
> style:
>     /*
>      * Star on the left for each line.
>      * Leading slash-star and trailing star-slash
>      * each go on a line of their own.
>      */
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is not my personal favourite, but seemed to be the
> closest we had to consensus in the mail thread for v1;
> I can live with it in order to avoid getting patches which
> use the styles I like even less :-)

Honestly, I don't like this except for "important" comments.

A "small" comment, e.g. one that doesn't quite fit on a single line, now takes
4 lines instead of 2.  Which is really annoying and IMO tends to break flow.

If you don't like

  /* gnu
     style */

or

  /* whatever
   * this is */

could you live with

  // c99/c++
  // comments

(I know we currently deny those in checkpatch, but that's easy enough to remove
if we're changing policy.  I have no idea why we don't like them in the first
place.  Or other c99 features like mid-block or control declarations, for that
matter.)


r~


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S7WcT-0006nD-2B
	for mharc-qemu-trivial@gnu.org; Tue, 13 Mar 2012 14:38:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S7WcQ-0006mZ-Jj
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 14:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S7Wby-0006NA-81
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 14:38:46 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:38281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S7Wby-0006Mf-3f
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 14:38:18 -0400
Received: by iafj26 with SMTP id j26so1259813iaf.4
	for <qemu-trivial@nongnu.org>; Tue, 13 Mar 2012 11:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=QuZEJRvo9jaznHocp+I3Oyfjl6d96QwkPD1ualZmPZU=;
	b=mssqC/xSc+wneaOrglpvLNTNiiqRnXwy39znYfIgrS1GuQr3Ia0IziXa9PI8XlcKUy
	aVoDugtZGp3pm7XZSIOF0ncIGX9NNUzvkDOXTNxwqrU3fhLH7If5Pe0B34rlw1V0qkQ5
	58wxGZlwVsAfnMnAFE27amBfOCGegW1N23MuYLCVfm/fEFkx0ZM5bq4Ek/7Ie7K4fmTT
	JTERXvgReem2lycjf0cU+ginu91ljoCwaZxjmDqyX5mLeGTPKUB6CrVySW2lFjxFt0mi
	wQn6LZpt3iqwJotJrRpThi1FBmYqKmWiKsqc401DmERj2N4A8TvTE0+XomLGzGK9RDa4
	uXQA==
MIME-Version: 1.0
Received: by 10.43.52.10 with SMTP id vk10mr21828837icb.25.1331663895902; Tue,
	13 Mar 2012 11:38:15 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Tue, 13 Mar 2012 11:38:15 -0700 (PDT)
In-Reply-To: <1331663327-29982-1-git-send-email-mark.langsdorf@calxeda.com>
References: <1331663327-29982-1-git-send-email-mark.langsdorf@calxeda.com>
Date: Tue, 13 Mar 2012 18:38:15 +0000
Message-ID: <CAFEAcA-sV8MHR+Q61VkriAgbdavm5b9W=FhscTmo=_E2bdMRqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkNO9DacxkUERWhkLSnQT5Gm1fi/RN/DKa0bid/1McMIoGyKOoOBRJKsEo+BRc+pW93QLGw
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Joshua Housh <joshua.housh@calxeda.com>,
	aliguori@us.ibm.com, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] cleanup obsolete typedef
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
X-List-Received-Date: Tue, 13 Mar 2012 18:38:48 -0000

On 13 March 2012 18:28, Mark Langsdorf <mark.langsdorf@calxeda.com> wrote:
> From: Joshua Housh <joshua.housh@calxeda.com>
>
> There are no users of i2c_slave.
>
> Signed-off-by: Joshua Housh <joshua.housh@calxeda.com>
> Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Looks like we missed this typedef in commit 9e07bdf8
which renamed i2c_slave to I2CSlave. (The new typedef
for I2CSlave is in i2c.h.)

-- PMM


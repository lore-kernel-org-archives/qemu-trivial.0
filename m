Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPcHF-0002V4-L3
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 14:28:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WPcHA-0002NE-6y
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 14:28:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WPcH5-0006ud-S2
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 14:28:40 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:41724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WPcH5-0006tc-KY
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 14:28:35 -0400
Received: by mail-la0-f51.google.com with SMTP id c6so3590668lan.24
	for <qemu-trivial@nongnu.org>; Mon, 17 Mar 2014 11:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NjRExmMi1tXHZ6CGp/6c0besk8rTRNmSJd5BrKG6wQQ=;
	b=aWFG4KJsXNwffw4ixZ+Bb4RZUb71Z7g/B5CDg+g4xJQqFxxtsUdwc9p2rvmGJmQ1Ky
	l3Z5ZtcGuxXXgDj2HTdHPGndTO3hk987Ta1p1f+2NIDwkmpl51z5ZI2+AifnqbeK0g5+
	MHadp+EThrrvMIoNL+rJmbTiwGgRISsp6OWhlWIJJjipAg2wbvv3K02p8vaROgbdLr0o
	aquYSXte7KSdujN6CqzRvOmL+e5rmyLkvBSBXdUcU+FOHb1y7BglwGnzsLG5QJ5Pf1kv
	E3bKq+g+xOfVoUT3S2qc4KYczdzkN+bi4P4tXkjZ+a5mNU+wLg/MXZfE1lYsGuGujfZN
	VoTQ==
X-Gm-Message-State: ALoCoQlQYWlWEYRK0ANAcAnGuUjgnxLMBqI/nIu4V6ZBeVgLcZ61N34KYD3SOkQlKFPzZMoFD2X/
X-Received: by 10.152.3.72 with SMTP id a8mr2498094laa.33.1395080914463; Mon,
	17 Mar 2014 11:28:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 17 Mar 2014 11:28:14 -0700 (PDT)
In-Reply-To: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
References: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Mar 2014 18:28:14 +0000
Message-ID: <CAFEAcA_m0B1Q-+jPKPtPg9DM9WT4sK2w02PA5f2+2aGkkkj9cA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [PATCH v3] CODING_STYLE: Section about mixed
	declarations
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
X-List-Received-Date: Mon, 17 Mar 2014 18:28:44 -0000

On 17 March 2014 18:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
> We had an unwritten rule about declarations having to be at beginning of
> blocks. Make it a written rule.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM


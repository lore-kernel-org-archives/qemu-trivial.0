Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeTFG-0000ND-RS
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 12:47:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UeTFE-0000MS-Br
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UeTFA-0003Iy-GC
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:47:32 -0400
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231]:57182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UeTFA-0003Ii-8G
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:47:28 -0400
Received: by mail-la0-f49.google.com with SMTP id fp13so5899881lab.22
	for <qemu-trivial@nongnu.org>; Mon, 20 May 2013 09:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ko8JOdITv8Q1jqgkvIx2vQqCldhvx0vY835BMI61ESM=;
	b=LCJGKa3gtTq1mgiIRxFQLr0v8p+EexmxawY7GjDPYBYLUH9uru06PO5Pt8sjwWZkP3
	YfEChH7j5iqLks8SAnPKrifMDCtlNcx8INh8oSX478EifzcoGpaOIzKp8vI0TAmgyoFk
	vx8KID1PztcKdWOAD7ZGi7rM5s5fkmANjvJt4kfBzo2otxU0DnXsxolcFyyQ39ECe97D
	PAgY1X/3UV9N/M2NZNott26B3vKfz1bR+lCV6d6WNNUXvOm7hqnukP70F0p3b5peUD5s
	12xO1oeFGOm6Rz1EwScAyMZSu4zekLHen5uw7z1fQXkMjYTciVa75v/P4hUHIk7YLtr3
	75Vw==
X-Received: by 10.152.7.102 with SMTP id i6mr28557838laa.18.1369068446627;
	Mon, 20 May 2013 09:47:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.188.130 with HTTP; Mon, 20 May 2013 09:47:06 -0700 (PDT)
In-Reply-To: <519A522F.80305@redhat.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A522F.80305@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2013 17:47:06 +0100
Message-ID: <CAFEAcA_VhTQvsE-XYa4pFZBXJq1kyMeOTp8ccxcLtriQJre+OA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnL7S73+i8U0bQh2FQpFeENhYoae8WQEVmnDYeOsSMB9hxFdY4z5Cb14hmNdZcvZ+Aa1TKi
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::231
Cc: Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema.json: Reformat
 TargetType enum to one-per-line
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
X-List-Received-Date: Mon, 20 May 2013 16:47:34 -0000

On 20 May 2013 17:41, Eric Blake <eblake@redhat.com> wrote:
> Yep, that raises (once again) the question of dynamic introspection -
> there's a difference between the maximum amount of information known at
> compile time, and the subset of enum values that are actually usable at
> runtime.  This list is static (all known architectures)

It's not really static though for practical purposes. The user
still has to be able to cope with "I know about architecture foo
but it's not in the list" (if talking to an older qemu) or
"the list contains architecture bar which I don't know about"
(if talking to a newer qemu). I think the only thing we really
need to avoid is changing the name of an existing architecture?

thanks
-- PMM


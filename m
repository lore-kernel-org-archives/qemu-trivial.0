Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUj4L-0004ZG-59
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 16:12:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUj4F-0004Tr-G0
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUj48-0008PP-PA
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:12:11 -0400
Received: from mail-la0-f47.google.com ([209.85.215.47]:46302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUj48-0008PE-Ib
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:12:04 -0400
Received: by mail-la0-f47.google.com with SMTP id eo20so3817397lab.20
	for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2013 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j/Fpn7OPkvqdsqGyXQsIq1Az1cYBgdxg6vmPTfKzQXg=;
	b=BK5yUlf6Ly52u/qAc3/fz+SCeaH6vkYIZluKGq0uFq0TfVn8xxDkO17EinGDtN0gUS
	l+WkwIm+1DloZzxIe9hwNMoHHXc4oJO5BhfIXEnfHe52T9Pjr9P1hTJnX7/nrdpfuy71
	IYUet833BNK20B58lr825wkk2Ui8kwelJVIAEjrFBh45KlH9RVY/+j19SIRbnz0g+jbI
	wseowdpFXJ+uaanIt+/5LVoWKBr3tbZxCQ4FSqTsCFajmOclaq+EvHgKkHWlZU9kDYTb
	5rlwmn99XCxk2uUU4ZA8JQ+vxnXBWCK64mXYJ8QfJ7ojzRubPKqx2mfAFS4LkGVOSPf7
	tEKg==
X-Gm-Message-State: ALoCoQlmBuF0FHn843HmKPccIFhnhpg1Z+hCAuicL6TgMXHCNHY2LTLbA5ejA58TsSj/gfwR7tIN
X-Received: by 10.152.8.51 with SMTP id o19mr71615laa.42.1381522323691; Fri,
	11 Oct 2013 13:12:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Fri, 11 Oct 2013 13:11:43 -0700 (PDT)
In-Reply-To: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Oct 2013 05:11:43 +0900
Message-ID: <CAFEAcA8CSJ_cg7bOO36xM_C6BVrRqmcZ3XTSg2p5f-kHX5BO-w@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
	grammar fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 20:12:16 -0000

On 12 October 2013 04:34, Stefan Weil <sw@weilnetz.de> wrote:
> * it's -> its
> * grammar fix in ui/vnc-enc-zywrle.h
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5ZEE-000483-8C
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 08:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z5ZEA-00045r-HD
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 08:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z5ZE6-0003mS-H7
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 08:47:30 -0400
Received: from mail-yh0-f47.google.com ([209.85.213.47]:35988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z5ZE6-0003mC-CD
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 08:47:26 -0400
Received: by yhan67 with SMTP id n67so55149642yha.3
	for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2015 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2VauLDpMJVCOlOBcbX7jJQ/mrkCLKdkSChhBOhI7qcc=;
	b=GU9HIGJLeiACtOU6lHqYdrNVMUf49ReGNgoZXPCdniBacap3py4HQ/GKPGIgcdTmCV
	sSpUcpcCMBLL6vTXupREL0DRq3xrQTumiJq1aVNNZsTX2XFmzOzRwAoQ9yPXYP7fxiJh
	84EppBfAQMYl+4IczknTOGDAr1u7tAcJ3ciD5r+P4GWWLFB+UgnjKRDqzAWkcBU6ALPF
	bsndkhsMknn6y4NodRuh2fGi7LPahFq81nZOxcO5Bpnwbxo5eZJfR4Yp67Cu9izTgD4u
	KZ7M0MSrPFrRJQtBHzWB/h1TXcSObr61CLL7S2iSDMJoXu6b3CE/y2LAKnTx3kCdbqHF
	SAIg==
X-Gm-Message-State: ALoCoQldfifmS+UISyTqixrmPr1s97mKVI3i05LzuGhYRF7G7xuyShw6QeVhRtDtESZQTMnz8BGH
X-Received: by 10.52.114.42 with SMTP id jd10mr8248491vdb.90.1434631645793;
	Thu, 18 Jun 2015 05:47:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Thu, 18 Jun 2015 05:47:05 -0700 (PDT)
In-Reply-To: <87twu5z7px.fsf@blackfin.pond.sub.org>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
	<87twu5z7px.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2015 13:47:05 +0100
Message-ID: <CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.47
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add .dir-locals.el file
 to configure emacs coding style
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
X-List-Received-Date: Thu, 18 Jun 2015 12:47:31 -0000

On 18 June 2015 at 10:28, Markus Armbruster <armbru@redhat.com> wrote:
> However, I can't see how I could define a new C style there without
> pushing the "local variables" feature well beyond its intended use, and
> triggering the confirmation prompts.

We wouldn't want to define a new C style, but in general the items
I have in my config over the Stroustrup defaults are going to be there
because I've noticed something where Stroustrup doesn't indent right...

> If we take Dan's patch, every Emacs user who hasn't already configured a
> suitable style profits.  Users who have may have to adjust their
> configuration to work with or around Dan's patch.

Is there some way to tell whether your emacs has picked up the local
style info rather than the one you have in your .emacs ?

-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0VPP-0000wh-2x
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 09:42:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z0VPM-0000w7-R1
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z0VPH-0003QF-O4
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:42:08 -0400
Received: from mail-ie0-f175.google.com ([209.85.223.175]:35391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z0VPH-0003Q4-KI
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:42:03 -0400
Received: by iesa3 with SMTP id a3so36268526ies.2
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 06:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uyfSc7co4C1ShWkzwinooUX8P7zZ3msFmj5jW9cqZk8=;
	b=UxNsMBIuK/ZYn7H/8k5hQL0K8rQ3PITY2ruIFp7PoiVM5fHKSFOiUgFV8LsLNxRrZz
	2DipBwKAZtVBF70TQZ0aSc6HAeiNGnC1CXZkUXpzoZvaXfBBRjplCpTDefAfI0URxk8n
	Ffx4uACG1I9kGlijS+vgAObCLvHhHPgbbzXsASb7wPkK3qS/doDWl6HQNkU2SI7KbMLT
	JVYjufO874zLJlc9/82xRN9y28MssVzdKt2+FIb9gqXwiaL1H5KyocdwbiIffKHk9guu
	ZCYA8jr+Gvx+YVQor/MX6SgiV02+3GxiVUO4fLEWj6WymnsmIFUvPI+/vv+ZrtEkMmfb
	FnEA==
X-Gm-Message-State: ALoCoQkDq3CwsrKFj4oUsRXnDso6SPmP0eJ3rRy22JNBdtMBhPTr3gfzGdxAgDIQ+axxVUk1PmfF
X-Received: by 10.107.169.157 with SMTP id f29mr24845839ioj.74.1433425323104; 
	Thu, 04 Jun 2015 06:42:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.21 with HTTP; Thu, 4 Jun 2015 06:41:42 -0700 (PDT)
In-Reply-To: <1433424607-3429-1-git-send-email-berrange@redhat.com>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jun 2015 14:41:42 +0100
Message-ID: <CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.175
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
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
X-List-Received-Date: Thu, 04 Jun 2015 13:42:09 -0000

On 4 June 2015 at 14:30, Daniel P. Berrange <berrange@redhat.com> wrote:
> Some default emacs setups indent by 2 spaces and uses tabs
> which is counter to the QEMU coding style rules. Adding a
> .dir-locals.el file in the top level of the GIT repo will
> inform emacs about the QEMU coding style, and so assist
> contributors in avoiding common style mistakes before
> they submit patches.
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  .dir-locals.el | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .dir-locals.el
>
> diff --git a/.dir-locals.el b/.dir-locals.el
> new file mode 100644
> index 0000000..3ac0cfc
> --- /dev/null
> +++ b/.dir-locals.el
> @@ -0,0 +1,2 @@
> +((c-mode . ((c-file-style . "stroustrup")
> +           (indent-tabs-mode . nil))))

My .emacs defines a style like this:

(defconst qemu-c-style
  '((indent-tabs-mode . nil)
    (c-basic-offset . 4)
    (tab-width . 8)
    (c-comment-only-line-offset . 0)
    (c-offsets-alist . ((statement-block-intro . +)
                        (substatement-open . 0)
                        (label . 0)
                        (statement-cont . +)
                        (innamespace . 0)
                        (inline-open . 0)
                        ))
    (c-hanging-braces-alist .
                            ((brace-list-open)
                             (brace-list-intro)
                             (brace-list-entry)
                             (brace-list-close)
                             (brace-entry-open)
                             (block-close . c-snug-do-while)
                             ;; structs have hanging braces on open
                             (class-open . (after))
                             ;; ditto if statements
                             (substatement-open . (after))
                             ;; and no auto newline at the end
                             (class-close)
                             ))
    )
  "QEMU C Programming Style")

which is a superset of Stroustrup and gets a few more
corner cases right, I think.

-- PMM


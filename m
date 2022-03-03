Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPkgZ-0006bi-Io
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2022 07:35:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPkgV-0006Wv-Sv
 for qemu-trivial@nongnu.org; Thu, 03 Mar 2022 07:35:57 -0500
Received: from [2a00:1450:4864:20::52c] (port=35367
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPkgT-0003mp-O1
 for qemu-trivial@nongnu.org; Thu, 03 Mar 2022 07:35:55 -0500
Received: by mail-ed1-x52c.google.com with SMTP id y2so1773933edc.2
 for <qemu-trivial@nongnu.org>; Thu, 03 Mar 2022 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s3iuDPI+C7CFzS1QKTXUsw7916VjE+RCP9v8irkZ97Q=;
 b=wBtG0Hd4h6PYEDA5NHaYt4s9LUvAJ7f1b4+AFufSjQ5gBU+F7Fwd+8i3yUOwrIhgeU
 W5J81cmAPpL4uTfDMpJ34UAnomGweYEj9Tgu8zKz4IVN/qPHlXp2NwJ7Xeo8QygNkuWL
 q8FaASOs9Z0LsdmAbr0E4FJXzaqkjp3zo9QIrN8A8+CYLpWSo117nC/MmcTTUwr9sldS
 9EBk/ygvlvlnnsfsP+qZoJ4FshAoGwSq+b0Lx8KoW5jhidj/gR0/vleALsK4M7q0AKEp
 vwb8pYhVDytTd4wuzodcOGSzzUiYrldtkDZ3t5+siuxKJ0QZM5EG02btxcQSk2zAqw3D
 TDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s3iuDPI+C7CFzS1QKTXUsw7916VjE+RCP9v8irkZ97Q=;
 b=Ueca1NlBPPtjyQOe4SY8WBSun80XSBNZagBwE2CYrGUkyPtOElK9OC/tH1VBiD/R7N
 4HU9Qybu+kI0BDG1zK3xzheeCMqKD3YIqXTgiw8bYipUlbnUJyk4eotu81a00ziZHU3V
 j7FAGNtCduHdOSa4xDI1NwqfzUTrGbGMTzJib/oGvZtyvHTE6yBc6I/RBOoAjGQUNRAc
 B0Qv82td2IIgk5JA51f5dzjap1DHhW+KPVSDWUafvT40ADoGiJMKSsvgDzXG5MRN+dH8
 Up6FfHUZwdjK5qVAL0VUJfxSnrPXmczGb82W2rZNcUvmg5iM9d2pvXwSvtW9aaMoQs6p
 qadQ==
X-Gm-Message-State: AOAM532FChrGBOFl2z1fWaIXL422w/GvhVjGd9OpjhiqEqAmX0SaGrCr
 QrQfw2jOP+PfG0ekBAgADSDX+A==
X-Google-Smtp-Source: ABdhPJwd35WZMZ0aS334c1tjtkLRkdrxth9kaMsbg2JQgUE0Ae1Yr6aeF8pHS1DpD1YxwQpLEUdIww==
X-Received: by 2002:a05:6402:3549:b0:412:b31c:5509 with SMTP id
 f9-20020a056402354900b00412b31c5509mr34544649edd.224.1646310952000; 
 Thu, 03 Mar 2022 04:35:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm636150ejc.120.2022.03.03.04.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 04:35:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19EE01FFB7;
 Thu,  3 Mar 2022 12:35:50 +0000 (GMT)
References: <20220301085900.1443232-1-thuth@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/Makefile.include: Let "make clean" remove the TCG
 tests, too
Date: Thu, 03 Mar 2022 12:35:45 +0000
In-reply-to: <20220301085900.1443232-1-thuth@redhat.com>
Message-ID: <87ee3ji57d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2022 12:35:57 -0000


Thomas Huth <thuth@redhat.com> writes:

> "make clean" should clear all binaries that have been built, but so
> far it left the TCG tests still in place. Let's make sure that they
> are now removed, too.

Queued to for-7.0/misc-bits, thanks.

--=20
Alex Benn=C3=A9e


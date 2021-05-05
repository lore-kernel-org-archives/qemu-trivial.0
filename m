Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leLUE-0003Ny-Au
	for mharc-qemu-trivial@gnu.org; Wed, 05 May 2021 13:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leLU8-0003NM-Ga
 for qemu-trivial@nongnu.org; Wed, 05 May 2021 13:38:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leLU2-0002LJ-IC
 for qemu-trivial@nongnu.org; Wed, 05 May 2021 13:38:56 -0400
Received: by mail-ej1-x62c.google.com with SMTP id zg3so4132984ejb.8
 for <qemu-trivial@nongnu.org>; Wed, 05 May 2021 10:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pj2AYyiSCZQYjZyQjKAfF4g8SHFCLO5vLVe4udmq9Ps=;
 b=LfWGWBe+9ctlqWDs2BKdQtwxFFmmZWBwjlZ8mpqg0Kb0jmctwWp0+9uSu6K9rcgzpc
 K8rTl1uOTcqNviMiJbQKNTRp5VWbIkN2cjfc3cP7Xq8sWVpL9uuC7s9zMWlY4zDTRjKz
 SuQ0bgL1bVBjh7fhCQeWBntVDh9m2Hq9EgAeQmllWFxdvc9PDA0Fx0eC29pd88OS6Ijt
 Tz4+Hta1eAAaznkPP2nyu5GWgJ/E+nbXc+63RtvDCFVkM8CQtHF4Kb+K3T5IqfWDCaGI
 yLVJRz4eLwat6iOMkRGKV9T4W4IUGP8spFHMSF6L5rbKSgX0kQAUqMGhU7Glv+xy2Np6
 rlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pj2AYyiSCZQYjZyQjKAfF4g8SHFCLO5vLVe4udmq9Ps=;
 b=tzDuV0+y5PxWO+W/qmS+khTTADjZv+Hfz0ph15xC+849furpZY/9VXUuv/FI2CUoJ1
 80QLfMAeVu2JKlQ3xsJnqyPbL0UsabDMTJc9tTe4iCvtGb6QjzhY1fdcU6POoCoKkCGf
 aGhcGTYbmIix+bnNhnFzmRpfsDzWABXoDdmdyxEnnoM/Ag8zrmipdor49EWMCxU++TS6
 2D1B9VBHavR7+wdJ9F49ufkOyi7evqkTR04Fv8EiPawl3tsGAPq+S8wzWqWILfpWMeyf
 aHzoyHXUjyWChvBpgsabLXChIFC9Y6WwBvPukaCPytlf55yHElY8Mgaegxt2hblFvcDv
 KnjA==
X-Gm-Message-State: AOAM531CV8asq5CDrQXCYYu6wpUbnp7oZEEwtV43vg0DbseqQVipHWN4
 CP73GeFJ4SiwVlXAZ7Hh5z71BZYp0kDOr+x0pC0r3Q==
X-Google-Smtp-Source: ABdhPJxZKNxvqbIs5pnHlN/IOLTQp3uPcMeXRJeV0YNvSD4o7m4Qj2sO6QIWwJcg+sDOtBFw4KubQqRFP73KJCIl4AU=
X-Received: by 2002:a17:906:3115:: with SMTP id
 21mr21871790ejx.482.1620236328383; 
 Wed, 05 May 2021 10:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210503083623.139700-1-laurent@vivier.eu>
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 18:37:41 +0100
Message-ID: <CAFEAcA-0ixPa9RojrqumN_gUyiu3awWjpkCRV3+MWuj0Q0PweQ@mail.gmail.com>
Subject: Re: [PULL 00/23] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 May 2021 17:38:59 -0000

On Mon, 3 May 2021 at 09:41, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to 9197b5d4b5f163455c891baec531ae73f5d3a73a:
>
>   hw/rx/rx-gdbsim: Do not accept invalid memory size (2021-05-03 10:07:41 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210503
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


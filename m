Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUhO-0000aP-Vm
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2023 09:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUhK-0008Pe-Vj
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:51:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUhI-00038O-F0
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:51:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso1156115wmb.5
 for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2023 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998698; x=1684590698;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXIcVgoejr8J6uvR+tTw5sflHYn7Flt6y4A5+zWzhAk=;
 b=uNS6D+ZSbVJpeSQd2j2IPW0McUT4joNgd8HkTL51TPZdwyM4mQ6iZAMLPW5nRHjbS8
 PY/INEP0I5MaYwR5DV//2s2owg4XWs18buWhgur++GRJiIJSVMKvxqg6xdL6t2uXQbMN
 vm+FOdR4cpEx3pgt4fDIF0dRZsy0e0zDVPNLucaRSx8i1ay2xTl85UaFSjNzoPt09vQx
 +yRr6ukXEGPkgNuRIunuNuYslXZZPYt2LKn8iSs+RqDo1mkmqjp4xN+QDxha8SZHh/xy
 RBNJhBppaZuLpPpQNqqpZuZzz33dJ8MUTFe54ohO/CaYf3W8SignnNdjcjJmHwpM1FLd
 o4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998698; x=1684590698;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KXIcVgoejr8J6uvR+tTw5sflHYn7Flt6y4A5+zWzhAk=;
 b=JY5V2/LRw1u4biPgMYOeZTvJ5q1PmDzv+YahPFaac7G2DockuSdqK5NZPA5ovvsgkk
 XUdD1i8jvQ2IV217nCe50J5wDBev4NLRpyy3GYLayK0N121f0vyfuHOq5cHIqQVOx04a
 2zhcuiUPgsYTfASFu6LBeQ0qqo7M3XtLg58A2LB/huuqxHZ02aon958aVFqwohT2ObhU
 KR3XZN2+SeRKdCWgxKoBwLv9w2htJ9hi8muQgBkYMuOuxjPacUlmsq7ZMCyJlEB1fQwR
 cVs+XwsVvNUrCssUt2GH6ouTPf8z1by1HbI9VmZc7/JehZ0hkz5igNrIfnWn4nY/EgtF
 Ec9Q==
X-Gm-Message-State: AAQBX9d7rUqyz44QNHnPrXEmz4OsXj6fVhE+8ZqKCs2vIUwOnZlKqJk9
 hb1wtoTwEIVLC6m0b+U9S1X1gQ==
X-Google-Smtp-Source: AKy350aOC4xHawuQszn+WB15j+CA3nXKJRZ78NOjDQnrQTpi3vkV6Yc01aEeVmL3KlN+SNO3SYkc0Q==
X-Received: by 2002:a7b:c8d8:0:b0:3f1:72f8:6a9c with SMTP id
 f24-20020a7bc8d8000000b003f172f86a9cmr1220244wml.6.1681998698345; 
 Thu, 20 Apr 2023 06:51:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c00d300b003f17eaae2c9sm2133738wmm.1.2023.04.20.06.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:51:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94C0A1FFB7;
 Thu, 20 Apr 2023 14:51:37 +0100 (BST)
References: <20230420122256.1023709-1-peter.maydell@linaro.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Date: Thu, 20 Apr 2023 14:51:32 +0100
In-reply-to: <20230420122256.1023709-1-peter.maydell@linaro.org>
Message-ID: <87jzy6d5li.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 13:51:44 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
> the virt board, but forgot the "since n.n" tag in the documentation
> of this in deprecated.rst.
>
> This deprecation note first appeared in the 7.1 release, so
> retrospectively add the correct "since 7.1" annotation to it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


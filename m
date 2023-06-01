Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q4oR4-00007K-JN
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2023 15:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ld.adecy@gmail.com>)
 id 1q4o4N-0007Es-9q
 for qemu-trivial@nongnu.org; Thu, 01 Jun 2023 15:34:47 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ld.adecy@gmail.com>)
 id 1q4o4J-0006ln-Df
 for qemu-trivial@nongnu.org; Thu, 01 Jun 2023 15:34:45 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4573e1e6cb9so1747569e0c.0
 for <qemu-trivial@nongnu.org>; Thu, 01 Jun 2023 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685648081; x=1688240081;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/XH7A3bclhFEuC6OKNDlw0mHxGGHdj3sdsgvcI6KXX8=;
 b=riUEVF31bAC6DPANCVSiLXHjwIkS56v73Bts08dT2FnUJdlIqmW4cAmWmC2+6GX/GM
 QwbCxcD4Vj8bv1IRqOEoFTKkwP3akeNOfoDg0O8E9Cqe+X940fNH9VDcsM+cTV74+IpK
 VXts/JnBBl3ok7FMzYCwR45MVN0ZiWSOd52NElPQcOBP1g6TX28bjbdaE0dhH+ben0VL
 wmqZmcBEI1g3oHyR5l7zFZhaOymp79UufIF7MCrts1eKUsAozDsBRblVaiRuvJrSq32Q
 DVIjAVjipx34JVRrU2D39S4JCi+NFX4YPKk5yPyKMioBwynaXHAZPs7BNGXIt12L9VpS
 lqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685648081; x=1688240081;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/XH7A3bclhFEuC6OKNDlw0mHxGGHdj3sdsgvcI6KXX8=;
 b=U75AbaXhcTF7/UlfctXO5InZbjQww3bRXxCC53Wwvq+mvXVy1Rgy9azlfrAOQzosxn
 p9QiGb4Uv05/YKcA9So/E7gqZ1VsfC7j5tiVTKKan/DyxBAQw293c7ldx7T6rmvY9FuD
 t7Ewn7CBpU7Yu3QoxUWIXR3i+lMqBIoRdyCo2EEL4wdTF9oYHcMXbWiu/TDFXpTjH5PQ
 zFimueovda3U5vJ6doG5FanxFOV8Qvk7JxBLwA5I5goL9RJPyQHFCeLeYpjJzNbnHKg0
 HGJMwrVdIKasfGXAoxtLIxMkzpYeNz1pyclnRBMo/J98y+oysV1Bx6eLhOSyVWLUM/0e
 XlaQ==
X-Gm-Message-State: AC+VfDwjq2jZ9meIpqRLj6Xa499BOu6+bRQLg2bejiPJwq+ZctrbPy+R
 FQZnHRkQg1ObzTJwlOpCK8se5ohH4g4fXiee7B6QHu5lIfZEKQ==
X-Google-Smtp-Source: ACHHUZ4Hc32E/WiGsP1gVQ8AdshtPMuNYOWDiu2AUaH//seyiWRCuI28gx437w03HdNlWU1vpeYf9SUqZ9SILTLDGBA=
X-Received: by 2002:a1f:7c02:0:b0:457:56a4:19e7 with SMTP id
 x2-20020a1f7c02000000b0045756a419e7mr1468157vkc.0.1685648081593; Thu, 01 Jun
 2023 12:34:41 -0700 (PDT)
MIME-Version: 1.0
From: Adecy <ld.adecy@gmail.com>
Date: Thu, 1 Jun 2023 21:34:30 +0200
Message-ID: <CAB295yB5cFSZpGE74EW5hDMSNGnZfw06UC5ydepUL0sdT96WGg@mail.gmail.com>
Subject: QEMU AVR Patch - Correct handling of AVR interrupts
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary="0000000000001ece7505fd168791"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=ld.adecy@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Jun 2023 15:58:13 -0400
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
X-List-Received-Date: Thu, 01 Jun 2023 19:34:47 -0000

--0000000000001ece7505fd168791
Content-Type: multipart/alternative; boundary="0000000000001ece7005fd16878f"

--0000000000001ece7005fd16878f
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to submit the attached patch.

Best regards

--0000000000001ece7005fd16878f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hello,</div><div><div><br></div><div>I would like to submit the attached patch.</div></div><div><br></div><div>Best regards</div></div>

--0000000000001ece7005fd16878f--

--0000000000001ece7505fd168791
Content-Type: application/octet-stream; 
	name="0001-Fix-handling-of-AVR-interrupts-above-33-by-switching.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-handling-of-AVR-interrupts-above-33-by-switching.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lidjc0zs0>
X-Attachment-Id: f_lidjc0zs0

RnJvbSBjODcyYzBmMTY0YTVhYjU5NWNmMzQ3ZDA5ODQzMDMwMWU2MjhiNzQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNhcyBEaWV0cmljaCA8bGQuYWRlY3lAZ21haWwuY29tPgpE
YXRlOiBUaHUsIDEgSnVuIDIwMjMgMjM6MjY6MzMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBGaXgg
aGFuZGxpbmcgb2YgQVZSIGludGVycnVwdHMgYWJvdmUgMzMgYnkgc3dpdGNoaW5nIGN0ejMyIHRv
CiBjdHo2NAoKVGhpcyBjb21taXQgYWRkcmVzc2VzIGEgYnVnIGluIHRoZSBBVlIgaW50ZXJydXB0
IGhhbmRsaW5nIGNvZGUuClRoZSBtb2RpZmljYXRpb24gaW52b2x2ZXMgcmVwbGFjaW5nIHRoZSB1
c2FnZSBvZiB0aGUgY3R6MzIgZnVuY3Rpb24Kd2l0aCBjdHo2NCB0byBlbnN1cmUgcHJvcGVyIGhh
bmRsaW5nIG9mIGludGVycnVwdHMgYWJvdmUgMzMgaW4gdGhlIEFWUgp0YXJnZXQuCgpQcmV2aW91
c2x5LCB0aW1lcnMgMywgNCwgYW5kIDUgaW50ZXJydXB0cyB3ZXJlIG5vdCBmdW5jdGlvbmluZyBj
b3JyZWN0bHkKYmVjYXVzZSBtb3N0IG9mIHRoZWlyIGludGVycnVwdCB2ZWN0b3JzIGFyZSBudW1i
ZXJlZCBhYm92ZSAzMy4KClNpZ25lZC1vZmYtYnk6IEx1Y2FzIERpZXRyaWNoIDxsZC5hZGVjeUBn
bWFpbC5jb20+Ci0tLQogdGFyZ2V0L2F2ci9oZWxwZXIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQv
YXZyL2hlbHBlci5jIGIvdGFyZ2V0L2F2ci9oZWxwZXIuYwppbmRleCBjMjdmNzAyOTAxLi5kYjMz
OGE4NzYxIDEwMDY0NAotLS0gYS90YXJnZXQvYXZyL2hlbHBlci5jCisrKyBiL3RhcmdldC9hdnIv
aGVscGVyLmMKQEAgLTQ1LDcgKzQ1LDcgQEAgYm9vbCBhdnJfY3B1X2V4ZWNfaW50ZXJydXB0KENQ
VVN0YXRlICpjcywgaW50IGludGVycnVwdF9yZXF1ZXN0KQogICAgIH0KICAgICBpZiAoaW50ZXJy
dXB0X3JlcXVlc3QgJiBDUFVfSU5URVJSVVBUX0hBUkQpIHsKICAgICAgICAgaWYgKGNwdV9pbnRl
cnJ1cHRzX2VuYWJsZWQoZW52KSAmJiBlbnYtPmludHNyYyAhPSAwKSB7Ci0gICAgICAgICAgICBp
bnQgaW5kZXggPSBjdHozMihlbnYtPmludHNyYyk7CisgICAgICAgICAgICBpbnQgaW5kZXggPSBj
dHo2NChlbnYtPmludHNyYyk7CiAgICAgICAgICAgICBjcy0+ZXhjZXB0aW9uX2luZGV4ID0gRVhD
UF9JTlQoaW5kZXgpOwogICAgICAgICAgICAgY2MtPnRjZ19vcHMtPmRvX2ludGVycnVwdChjcyk7
CiAKQEAgLTczLDcgKzczLDcgQEAgdm9pZCBhdnJfY3B1X2RvX2ludGVycnVwdChDUFVTdGF0ZSAq
Y3MpCiAgICAgaWYgKGNzLT5leGNlcHRpb25faW5kZXggPT0gRVhDUF9SRVNFVCkgewogICAgICAg
ICB2ZWN0b3IgPSAwOwogICAgIH0gZWxzZSBpZiAoZW52LT5pbnRzcmMgIT0gMCkgewotICAgICAg
ICB2ZWN0b3IgPSBjdHozMihlbnYtPmludHNyYykgKyAxOworICAgICAgICB2ZWN0b3IgPSBjdHo2
NChlbnYtPmludHNyYykgKyAxOwogICAgIH0KIAogICAgIGlmIChhdnJfZmVhdHVyZShlbnYsIEFW
Ul9GRUFUVVJFXzNfQllURV9QQykpIHsKLS0gCjIuMzkuMQoK
--0000000000001ece7505fd168791--


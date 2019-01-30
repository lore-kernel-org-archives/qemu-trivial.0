Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomsO-0003q7-7R
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:13:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomsL-0003oa-Oq
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:13:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomsL-0003c7-4F
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:13:45 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50255)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1gomsK-0003Ws-Ri
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:13:45 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N4hj5-1hGbMq3MqF-011gfl for <qemu-trivial@nongnu.org>; Wed, 30 Jan 2019
	11:13:31 +0100
To: qemu-trivial@nongnu.org
References: <20190122145132.12571-1-paul.durrant@citrix.com>
	<57cd3429-41a3-48c5-4d06-5d203cf70f97@redhat.com>
	<CAFEAcA9Ne8=buW5FGr8AbuTdovrdAdFcZJG01N_zkQGrXJ85FA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <07ab9296-2e67-4193-ecfe-4a6d855c0633@vivier.eu>
Date: Wed, 30 Jan 2019 11:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Ne8=buW5FGr8AbuTdovrdAdFcZJG01N_zkQGrXJ85FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XrP7jZiQ6zOubC6l4gjcJEBThvZjoJC0aCcXrM6sMK7tumd+mEW
	7XDbLjehIa5KD646X5qq6TeQx2OwMksZIc59gMpAKbthBe1bfSWdIY+h7LRLHb2y1ttW8r5
	iccbEEOk4ZMfFoDbKaIiLdMYZC7IaKEoDOtsPaUveNqLfOwHk/JE9SNybd4q+Fa82nNyCBU
	xX8mYWIGNbKU7rhoRMZDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZPA4FfxCWOw=:v4MlaM1HEU5sXKW7nRuED0
	7GAQdZR+aKzj3+T+r5r4u5S/Lun/casMnag/irqU3+Ox6tEwXE1VSr84DIjVBX2VdzUiQn6hz
	HtvbY5eb4Q1uhrwxj7j8IhX2oblXlWVvXrgq5/ws0P1/K1BCzHTIzgO6bEsbrQwPY0AIyvKYV
	ncGubJiiczHHP4u+5Yu4llOQu+NKIkoI+rFIkHzqY095DE2Gcn5sT4klFVwQWWXyxOGiBvR8d
	gwveflT2G9ySfNsZWeTGiDu2XywGjQ3GtBixxb2YWsHsvzUSNz0tbUEbOCrGHT3cHx93eYilC
	fEPPwOjAoNS/Da72xk/ZqVusA9ZVSzay+sxWx+zokRAOPGJmCT3IQAiiWKEq6k8jlfEl9cCIA
	HFTe9q38rUE3H4gt+y1ecKv3I+vyzWy1pPLk6u3pBqQy8597mYNYDTwlojcyHjj8HO/Pc6peN
	kFCgeqN0rKa6kSREIhUUsS07Qxfl/39/Qkvv37sYmyAy6svG5kJDiKR1AZX9PYSKRYDFUKFzY
	03I9so8kMGLeyUiNa0D3MW9vTS6Sv6fmrq2lmwmw4rZ7VJ2Pn5/AL5DyZjioNQxIxcqE6AVFi
	ycFIbfeL2YvsvC0eqg4bA8xlW8kjfG0TmlmJKe3EyPJL6J9ittDnh9JG/n/i6has9Np8T0Mnh
	aTRfFFQQ+YM3dEJTnLIhPRHLtNamA51M5v0AMhB5qLCojcBKlyiFuM2vMQ1hVNOf7MzsGWek3
	vggz0gmvnS0g1vpIdX9p4NE4zv14XSkCM85h9OImK/ZQAthpxWu76+CfWFE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/block: clean up stake
 xen_disk trace entries
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 10:13:46 -0000

On 28/01/2019 14:51, Peter Maydell wrote:
> On Mon, 28 Jan 2019 at 13:41, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Cc'ing QEMU Trivial.
>>
>> On 1/22/19 3:51 PM, Paul Durrant wrote:
>>> This should have been removed then xen_disk.c was removed but I missed them.
>>
>> ... when xen_disk.c was removed (19f87870baa) ...
> 
> also s/stake/stale/ in the subject line I guess ?
> 

Applied to my trivial-patches branch with changes above.

Thanks,
Laurent


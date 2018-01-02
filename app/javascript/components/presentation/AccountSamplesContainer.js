import React, { Component } from 'react'
import update from 'immutability-helper'
import Card from './Card'

const style = {
    width: 400,
    marginLeft: 80,
    border: 'solid',
    padding: 10
}

export default class AccountSamplesContainer extends Component {
    render() {
        const { accountSamples } = this.props

        return (
            <div style={style}>
                <h3> Avaliable Samples </h3>
                {accountSamples.map((card, i) => (
                    <Card
                        key={card.id}
                        index={i}
                        id={card.id}
                        title={card.title}
                    />
                ))}
            </div>
        )
    }
}
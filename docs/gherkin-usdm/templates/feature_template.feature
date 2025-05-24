# language: ja

@USDM:REQ-001
Feature: 機能名
  機能（Feature）の説明を記述します。
  複数行での説明が可能です。
  この機能が提供する価値や目的を記述します。

  Background:
    Given 共通の前提条件
    And 複数のシナリオで共通して必要な条件

  @USDM:SPEC-001-01
  Scenario: 仕様名
    Given ユーザーが〜の状態である
    When ユーザーが〜のアクションを実行する
    Then システムは〜のレスポンスを返す
    And 〜の状態になる

  @USDM:SPEC-001-02
  Scenario: 別の仕様名
    Given ユーザーが〜の状態である
    When ユーザーが〜のアクションを実行する
    Then システムは〜のレスポンスを返す

  @USDM:SPEC-001-03
  Scenario Outline: パラメータ化された仕様名
    Given ユーザーが <状態> である
    When ユーザーが <アクション> を実行する
    Then システムは <結果> を返す

    Examples:
      | 状態 | アクション | 結果 |
      | 状態A | アクションX | 結果1 |
      | 状態B | アクションY | 結果2 |
      | 状態C | アクションZ | 結果3 |

@USDM:REQ-002
Feature: 別の機能名
  別の機能の説明を記述します。
  この機能が提供する価値や目的を記述します。

  @USDM:SPEC-002-01
  Scenario: REQ-002に関する仕様名
    Given システムが〜の状態である
    When 〜のイベントが発生する
    Then システムは〜の処理を行う 
